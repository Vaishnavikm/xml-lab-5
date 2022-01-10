<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1 style="text-align:center">Inventory details</h1>
                <h2>Products:</h2>
                <table>
                    <tr>
                        <th style="text-align:left">Product_ID</th>
                        <th style="text-align:left">Name</th>
                        <th style="text-align:left">Quantity</th>
                        <th style="text-align:left">Price</th>
                        <th style="text-align:left">mft_date</th>
                    </tr>
                    <xsl:for-each select="inventory/Products">
                        <xsl:sort select="product_id" />
                        <xsl:if test="price > 500">
                            <tr>
                                <td>
                                    <xsl:value-of select="product_id" />
                                </td>
                                <td>
                                    <xsl:value-of select="Name" />
                                </td>
                                <td>
                                    <xsl:value-of select="Quantity" />
                                </td>
                                <td>
                                    <xsl:value-of select="Price" />
                                </td>
                                <td>
                                    <xsl:value-of select="mft_date" />
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <h2>Stocks:</h2>
                <table>
                    <tr>
                        <th style="text-align:left">Player_ID</th>
                        <th style="text-align:left">Name</th>
                        <th style="text-align:left">Age</th>
                        <th style="text-align:left">Email</th>
                        <th style="text-align:left">Phone_No.</th>
                    </tr>
                    <xsl:for-each select="user/Player">
                        <xsl:sort select="Age" />
                        <xsl:choose>
                            <xsl:when test="Age > 17">
                                <tr bgcolor="#ff00ff">

                                    <td>
                                        <xsl:value-of select="player_id" />
                                    </td>

                                    <td>
                                        <xsl:value-of select="Name" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Age" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Email" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Phone_No" />
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>

                                    <td>
                                        <xsl:value-of select="player_id" />
                                    </td>

                                    <td>
                                        <xsl:value-of select="Name" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Age" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Email" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Phone_No" />
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
                <h2>Trainers:</h2>
                <table>
                    <tr>
                        <th style="text-align:left">Trainer_ID</th>
                        <th style="text-align:left">Name</th>
                        <th style="text-align:left">Age</th>
                        <th style="text-align:left">Email</th>
                        <th style="text-align:left">Phone_No.</th>
                    </tr>
                    <xsl:for-each select="user/Trainer">
                        <tr>
                            <td>
                                <xsl:value-of select="trainer_id" />
                            </td>
                            <td>
                                <xsl:value-of select="Name" />
                            </td>
                            <td>
                                <xsl:value-of select="Age" />
                            </td>
                            <td>
                                <xsl:value-of select="Email" />
                            </td>
                            <td>
                                <xsl:value-of select="Phone_No" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>