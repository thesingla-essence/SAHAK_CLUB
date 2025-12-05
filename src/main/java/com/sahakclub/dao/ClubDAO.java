package com.sahakclub.dao;

import com.sahakclub.model.Club;
import com.sahakclub.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClubDAO {
    public List<Club> listAll() throws SQLException {
        List<Club> list = new ArrayList<>();
        String sql = "SELECT id,name,faculty_coordinator,student_coordinator,description,image_url,engagement FROM clubs ORDER BY created_at DESC";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setFacultyCoordinator(rs.getString("faculty_coordinator"));
                club.setStudentCoordinator(rs.getString("student_coordinator"));
                club.setDescription(rs.getString("description"));
                club.setImageUrl(rs.getString("image_url"));
                club.setEngagement(rs.getString("engagement"));
                list.add(club);
            }
        }
        return list;
    }

    public Club findById(int id) throws SQLException {
        String sql = "SELECT id,name,faculty_coordinator,student_coordinator,description,image_url,engagement FROM clubs WHERE id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Club club = new Club();
                    club.setId(rs.getInt("id"));
                    club.setName(rs.getString("name"));
                    club.setFacultyCoordinator(rs.getString("faculty_coordinator"));
                    club.setStudentCoordinator(rs.getString("student_coordinator"));
                    club.setDescription(rs.getString("description"));
                    club.setImageUrl(rs.getString("image_url"));
                    club.setEngagement(rs.getString("engagement"));
                    return club;
                }
            }
        }
        return null;
    }

    public void addClub(Club club) throws SQLException {
        String sql = "INSERT INTO clubs (name, faculty_coordinator, student_coordinator, description, image_url, engagement) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, club.getName());
            ps.setString(2, club.getFacultyCoordinator());
            ps.setString(3, club.getStudentCoordinator());
            ps.setString(4, club.getDescription());
            ps.setString(5, club.getImageUrl());
            ps.setString(6, club.getEngagement());
            ps.executeUpdate();
        }
    }

    public void updateClub(Club club) throws SQLException {
        String sql = "UPDATE clubs SET name=?, faculty_coordinator=?, student_coordinator=?, description=?, image_url=?, engagement=? WHERE id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, club.getName());
            ps.setString(2, club.getFacultyCoordinator());
            ps.setString(3, club.getStudentCoordinator());
            ps.setString(4, club.getDescription());
            ps.setString(5, club.getImageUrl());
            ps.setString(6, club.getEngagement());
            ps.setInt(7, club.getId());
            ps.executeUpdate();
        }
    }

    public void deleteClub(int id) throws SQLException {
        String sql = "DELETE FROM clubs WHERE id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
