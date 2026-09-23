Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AF3C1977
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143486; cv=none; b=ZOeidAOBE/HhueqWHm+4KeMXkfimR5No5Bg0aFSW6jP5TN3096APgrUYH2QI+NDBrorlwFMIoGNqQWWBZNVkN1QRipxvZOeccYK0EdC5r+gctciPy2dQCwGuweosC38+hR1T1TnjEdO7tz4YndqVyht03ddaHoRtGv8cBWOtVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143486; c=relaxed/simple;
	bh=bvrVATNrYUGQD4mbSi+niLn87cAnb4xf2QWn2yNGmnk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jjMXv6B+dhButlhdfrRgm4TxsqBK09D6vyz6wfxmnkGG4oiQXWzC4hm9m7+vOg5K/36DEOct7jCGbRNgf1bV/FpUBxnsI2vJjVuuLScKfOzKe1zo38MgSTwUKmZVrkZT/TiNla9zRsmsuzgr2+1P0SWcnrq79pmvYpv+xrddJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUnGCFF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6wf5o94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUnGCFF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6wf5o94"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ijr81425421
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A4IntU3s8x9cUVN8CZ1tZN89y+BE+ON00Xs
	gdwyZ3e8=; b=PUnGCFF+1G/cjc24MgRQf5snoDnCog3cmHmDWAW/BGsxnB+KUAE
	FtaeYjEsFzsyFyVBO3WLdw2G/ufr2V7ji4Ko69dPB4KHaz+v3ax/LHLSC5HkrkMx
	9y+3qMSDi2uW9tgAhkK6eDuhXZe7BTpDBeVNMXY33nuj1839gVaa/Un1m0gFQ4bg
	3VCNNhg3SzBPx7cRl+7nW65yL54Tf4yKKCK1uqEhXkDLHqnW/h9nJK0Txiat+LJr
	pQELSdZ4luIJUT1/aIgVjRaEa6MUwNGsdG3brhewRvRg3Wx2E75FvGS9GVFXa43p
	Osv7JUl06QXGltr8swvFHriOrlUtW7Pk/LQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c2fcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:04:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-143803143c4so1197791c88.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 23:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790143482; x=1790748282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4IntU3s8x9cUVN8CZ1tZN89y+BE+ON00XsgdwyZ3e8=;
        b=U6wf5o94nC02Jop2j8ruJt4IHAAWdX24x8991sZd1cm2y1fcAlheFBZH/RW0QfrjEz
         6Yxw8n5iPh+R6I8XGtG4XnpB4UMla0rpO+cOysdeboTb1atGBMcI/42Yc8hFtO0jfnNg
         lMTiVWt9h/bkaNvH3eWBdSlRYEtca871CPC+tJA1BdsCTuMmaNcv8fBHjV8+dCz5zViZ
         aN0I737/rHQxG9dDSs8sMAFGPMee0ZiIUnklq9fzK3Yj4Vga2WCTBFNvyqfgyuth9dZc
         i+e29SOw+mfvtVIwHoX3H7X4YL6yknGIiFE6mlUtqHhIyl+iorc3LStVFOi0w2UfrGK0
         s32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143482; x=1790748282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4IntU3s8x9cUVN8CZ1tZN89y+BE+ON00XsgdwyZ3e8=;
        b=TjDSAMjRv1/Fe3AlQl7tP49DYPwXEUFcN83skwIxdOO7kcB87Hr3e4Oojblpyklerm
         qv2j82psFoRvOvntil5/KCjI3OorgmzHTL1KjyyxMx/R4C7VexeJzSHvePD/MITO2aSK
         riX+ZtIa1M4W7jmEC0YSc+zLlYGSBYfKqFb5xuxTnQTBFRpNEioE5tOR/qsqwalXm7vH
         1nKPYCcdsvJSIVmG1BIG+8yUfBVbSUifc9m/RSvrIoP+aGWZ0X5i3zKG2jkc05IDTCDl
         tCqCJHhAhgwPqVD5sU+ZWgrzE9GwIy39jkmkMHMg0JVCLk/wz0W3z+ibjLFsKAA5sqqC
         48mw==
X-Forwarded-Encrypted: i=1; AKwUvBxIWyfjcg0Z/4wPge89egmkwk5pPwPKV8HH7hpHJpyQxwgeAiN/cfza6pyIvPBjQ6w3lXvN4UNhgUs=@vger.kernel.org
X-Gm-Message-State: AFuF++nckdLFD2zJ9RL+bN85E550S8U6pMdje1tfZ2vZB1i0RZDjMScF
	ohHyzfsSk2vAn97MBS6/8lALkQ8mZeOeEtCnMkJ0KznRY8x9Hsr4eNV7YuJbEFAEEeKuxj2TA4a
	JWS77nuaALV4MX5E8tvoE7OTgZ08OzGkHTJuGp6yRqDGw7qu2V0R5orexBAdH63Q=
X-Gm-Gg: AYBFou05XsXns46DxcrLf+ojz2Ix3W5eItut/2T/W7caXJ7R1gJsadtLUCcCa8lPRs9
	G3Yfx9BZq25ZpoqgqKoVGXGpjLmRetcGpRXsX0uU0lK6cARAeNY2HjNW/oTsiaN5kcBbexE/7sg
	kKoBa3cedXZfJg6LyZ24r+yVLrC7I2lPfJyQABYSVgfg3XRU6JZO6Tb6YxxuLRwpYk0oi4hu7h5
	fy5Qwb6CkJTnqIdk8kpDOfsdwkviuBaEw810ZpRRYC7anOBL3vkEiNBvAwQCA+uWxwSGGdfZSOD
	B2yDMmqySxgMF3C2QQ6ztevNjQ/pInlfaA6ULdsBPm5A8Miho9VDUzA+cuEw3GE7vxobDt7YR8h
	exQ7gq+htD33hxOoyddO7p0Gl58016dMssBmURDw=
X-Received: by 2002:a05:701b:4503:20b0:143:26cf:8616 with SMTP id a92af1059eb24-144f91546e7mr1785663c88.24.1790143482485;
        Tue, 22 Sep 2026 23:04:42 -0700 (PDT)
X-Received: by 2002:a05:701b:4503:20b0:143:26cf:8616 with SMTP id a92af1059eb24-144f91546e7mr1785639c88.24.1790143481871;
        Tue, 22 Sep 2026 23:04:41 -0700 (PDT)
Received: from hu-uaggarwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm5050512c88.13.2026.09.22.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:04:41 -0700 (PDT)
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Subject: [PATCH] usb: typec: ucsi: Set ucsi->connector before enabling notifications
Date: Wed, 23 Sep 2026 11:34:34 +0530
Message-Id: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D0I1b_oHEr-34zRv_bnis-vWGnS6rqxU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfXxUhkC2LfLI2u
 6me3PQlfn8qPyq/WMaxmbIH8TIICEDlD2zAnBmFtGBgKXVtl00rns284bXjzHj7fPlaaIoIaQ8a
 4FUWn874igfgUbW3sWqZZiTSxNVndE4=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab36bfb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aR1d7MnS8zDfWtQP9dEA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: D0I1b_oHEr-34zRv_bnis-vWGnS6rqxU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX1miQdOG8dQLO
 7raqz4jjcZlVc2/Qaiv/cXKRCOtrhAYLULnLWTUaPVxLRwfUt+MvOpq0w3TqEw6V3k/8w7ItjXq
 1LokyvRgIk9yL9RfMH0lu16Pfe4UnKdG9F2tv7Uf5i0eIdoCrVa0t/7D3rAhD/H6t7xZgvT3Xch
 19hQxhVjaFkC9krqyN+v4weSJgI2IG1Rhk9+OtR112XTC1I07tfazCLbo7/0fO0JNGME7KZbfyd
 8idRsldnO/0PF1QJIOm0cLsngZ/Jbit44MWXGeUmwtq0EgfoI+jqVquA2MqKC03Avm7fso0sm7g
 jTvS9V+LLU1cA3hYoXgzyPpIXXCJZ2n4byZDAARcF85WJJuC9jSOy9e0mMojOEaVtU03Yu5vVlV
 fEKyPCW6GNYEWmw9o/1lQsEvfdwaqOpXhi2rh+tZYsNmUAHswCGAJ5JPeUp+SeXAqLbZtMahx3K
 HgWX+v6CyqPk4zT1N/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230024

In ucsi_init(), ucsi->connector is assigned only after the
UCSI_SET_NOTIFICATION_ENABLE command completes. But once that command
is sent, the PPM is free to raise a connector change notification at
any time, which is handled through:

    ucsi_notify_common() -> ucsi_connector_change()

ucsi_connector_change() indexes into ucsi->connector to get the
connector and schedule its work item. If this notification arrives
before ucsi_init() reaches the "ucsi->connector = connector;" line,
ucsi->connector is still NULL and the driver crashes dereferencing it.

Fix this by setting ucsi->connector right after the connectors are
registered, before notifications are enabled, so it is always valid
by the time a connector change event can be delivered. Also clear
ucsi->connector in the err_unregister path so it isn't left pointing
at freed memory if a later step in ucsi_init() fails.

Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..8f7b73a9f4f4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2122,6 +2122,14 @@ static int ucsi_init(struct ucsi *ucsi)
 			goto err_unregister;
 	}
 
+	/*
+	 * Set ucsi->connector before enabling notifications. A connector
+	 * change event can be handled as soon as the notifications are
+	 * enabled below, and ucsi_connector_change() indexes into
+	 * ucsi->connector, so it must not be NULL at that point.
+	 */
+	ucsi->connector = connector;
+
 	/* Enable all supported notifications */
 	ntfy = ucsi_get_supported_notifications(ucsi);
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
@@ -2129,7 +2137,6 @@ static int ucsi_init(struct ucsi *ucsi)
 	if (ret < 0)
 		goto err_unregister;
 
-	ucsi->connector = connector;
 	ucsi->ntfy = ntfy;
 
 	mutex_lock(&ucsi->ppm_lock);
@@ -2143,6 +2150,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	return 0;
 
 err_unregister:
+	ucsi->connector = NULL;
 	for (con = connector; con->port; con++)
 		ucsi_unregister_port(con);
 	for (i = 0; i < ucsi->cap.num_connectors; i++)
-- 
2.34.1

