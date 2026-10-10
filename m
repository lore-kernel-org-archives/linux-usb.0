Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C7411665
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610427; cv=none; b=sfw+kIUmyubVPDZUNBwIA1Ls1yY5myjRkLJIRGQVY97E3M/MQHEzLFLNTRCnAAEohosrtwKRrC5kX0MhPSCXBBHjScXjGZrw6z6g4fMWF9KcZvEeM4rSquD3B9LS0aZkVhjN35pMgghT1mPCeJLBikBzf6KQ84hR7ZOxKMrBJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610427; c=relaxed/simple;
	bh=ki44rZqsHENfxwVaIlWsw0mriK3sPfARHJY4IeNij7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cs7oL5nGSzFuJJYZgzXply8gbJcN8Ok7fAV6tyK5XqnDYm+fuT9ytIaZejnSmHSEy/zF8Iw+w/Pg3p6JV7AXYKtnTgRhP5sWg3UGRcdhDK+ChwWer2c0TG1e5SjTHEDAmY6nHEt3OMLPR+yhdkYNpO6BqRyF7OAarXhexyCRyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YE7LAYmc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWDjNrHX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE7LAYmc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWDjNrHX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eRvd3281616
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ihzh9krNeTK
	98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=; b=YE7LAYmcCTo88TujnZaF+ZJ1Mrx
	X4sZ0y3CgpXlxtyvyse/p0u67xcdLMMH13CYJ+meD7Maf7whpr/87TBoaK5NBXdy
	5dxahD0NmjQuCoArfxZoCxjlz18fyCGQfO4etJeaf6lzW3luJlqIzqaXKUSWmi8o
	NGfbwk/tnWeZncbKYkJJkMVDb7tUkj3xQuQzug326MQOUCKqHsHn/nR4Px7Pb1mY
	6HfXLuxthIJ6AqpG4HoBboezVec9yI7q1/kPQr4ZCm9NlWE8Wu6BAbqlW3KftTJV
	/YhyhAKwqHp0KhzzAzEmoOhEDStbrjYh2FErmjRUR+iE/Bi2FsIEBiQ8oLg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpggbht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-887e45c7063so275452b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 22:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610424; x=1792215224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=SWDjNrHXMiemp36yjHdSBW2RwcN7eJ25Qxipx6uBUzaLofAkvn3kImAKTfGSkfXYAD
         QsR5w1Jk/fcqHPoqprwajyg4AqyAq6llPdx6uXO6EddtdS6cm+OAY/22af7V6PDeEe89
         HNvQdsCQC/Ba+dQmkR1o9gxdmv8QmbHrBV7Ixr+Dr/jg4G/JDXs6zwqNjiCOBUaXfuXz
         SzCb7gd3GWFTqQlVutkhHbJTAZVexvP5WirvWrSe2JChaDun4WfRTg/x3XGkaAezVMtY
         O8CiW/7rvB1jVJw+N97Qyqamv8QoXd4ChBwaqTIYkbIbBOiWLgznAHXh8m6Pzqz6563A
         BVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610424; x=1792215224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=KEnOBAILxPogt5lNylkUp3nusB4C7HQgP1P4mNZzLlxHNAqWxnkUkIGR9T2uyh/8kR
         YboVNlwLZQVyflNeWFrbU3PvczHh54qz5L+NvJvQWswBYDydbCVmxUIjSfchdOm+77ct
         vVEYfgshNoYHxZCz+D5K8X2vXDGgNdMmFrdRtLvnXUQe8h+MxfqgrAZN5rRZ14dumBqH
         009OecVVZ9+qM6OdTBe3UzchRFWTxQ7ADQKaSQ7AJceOAXDRDwdfHZLKkVf4EbBQV9Q2
         a8JMORwWMXstIi86a0C78UdI0YeOTiIZp6PiU7o/mlwwxil+3zopjdYDmrR+iO+3UlBC
         FRfw==
X-Forwarded-Encrypted: i=1; AKwUvBx0mj9ZGACbQjdFzTDF+yG/h6252hQDtU7LXUPU9SC5iBTaNGd+M41BoqXntVsVfH+L0xVsaSiHX7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmQ+yj+kV5gvlf0dQdCUsfI+z1JgjRM+ZINtiE494e3+viVdgw
	WwdozGjJ/2J5ofrB0+F80Au+9Busp5rPDRLuV1Ju8mkpqbKZqdejiPNkLJthVLQgloxyczVgA2q
	3BH7fdvoE6ZLml9yPLQ7EwzwLHLr1zIhmAdeOZyZA7k3uWNnXVd1BPJ7u7773eLs=
X-Gm-Gg: AYBFou0s4LqRNuxqO6rjMceAo6CjozunUGoOen79kxTnCVnquGk5UI8QRTcbJkrXqvu
	rFSCLq954d4g/zQxSt9J/ERoKT0Ku6H0txrdB0ztWQb9fQGrcfRq0rxzeZCBAVN+k2BQsVGomuK
	dzmFajKIaLe6dv/UmfHhO4dHlz/FO0Af6KK+SxyxKypu3PO00MOZJMSaRz4f5Yz0jWlh7wfZIww
	a96USTBepy6S6ZNZckTNifRL4QmqpxBIfkGmQr0bcXNsZ5gQ7csgluS/1LDk5gvp84TqmosnZ4J
	kJq8ctDSlo+W9+zjysKbTKq/mxVK+KZ6mrma4g2xO5oYWUjpcgPtsZGoDTbFgrQHkQxZyt9+CL+
	XO8RHiuFBJ64G8wIWQAAfn0hk3i8boNg=
X-Received: by 2002:a05:6a00:99f:b0:886:61e5:cfbd with SMTP id d2e1a72fcca58-897c79d7cc1mr3405927b3a.45.1791610424127;
        Fri, 09 Oct 2026 22:33:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:99f:b0:886:61e5:cfbd with SMTP id d2e1a72fcca58-897c79d7cc1mr3405915b3a.45.1791610423647;
        Fri, 09 Oct 2026 22:33:43 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:43 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 7/7] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Sat, 10 Oct 2026 11:02:46 +0530
Message-Id: <20261010053246.2991984-8-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX1FRCasev2R6S
 2R2X0OflCNVIMwmzQFe6Jihxscqss5cxjOTsxWfYfqFlY7d+ctKJSc+Iu2qEm2lnL5Meo5LhgRX
 n2+Ekt0UC65KuutWxF3PWYsMMKiiDAI=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6ac9ce39 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KL4VWcfqKbbHtFUGL8sA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: SbbTL6IBz5h2Vcpd47X-YcM0GqKNUldZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX7ST0acNTlxoO
 GXlan2s4/ozUGZ4vjo41f9vl7GuIyrfMCcaM0JSIquL+vtkrEJ54QwQGE2ZkyELXifRSsx4BH0f
 Z2gaI4OuaFSqou0FSTsNquTC8V9E4S6yXZURyiWBya9+dqW/1jsITKeP555FR5nh16snmR5KcxT
 c3D0cnAI3Kun5/UXNRQpIjNyO0eovCjrVTD3KzUBmEb4tJt/6cXCR3SZLQp/O6BL47jYwYhrfmb
 06f13JUo4J0kWvDUP8bn8J3NkbthNJDmNUqLZWYQYkqkGZgtMy7qyUDlBZC58W5SX2DqNXTY2W+
 KOEu6rypp5MoHzWDJHqsA4zWmsxKglNoZoHv8kSTVGHy6GIXziR5ATJyADpQgDFatqG9hOtrFQl
 3xwuG5kw4P+Ov2udJo4ec1IqzMrA96oZNE8ynIYm8WgNMHV8yXJonlo2+v0Gwp/TDSpj6usN4xA
 bv/M+9Nxw/SJBXmH7CQ==
X-Proofpoint-GUID: SbbTL6IBz5h2Vcpd47X-YcM0GqKNUldZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override at probe whenever the initial role is
USB_ROLE_DEVICE.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0896a323bdda..92f1223f7b21 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
-		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
 			qcom->current_role = USB_ROLE_HOST;
-		else
+		} else {
 			qcom->current_role = USB_ROLE_DEVICE;
+			dwc3_qcom_vbus_override_enable(qcom, true);
+		}
 	}
 
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
-- 
2.34.1

