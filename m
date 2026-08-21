Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131C4B8DFF
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321089; cv=none; b=JuX1nxTio16o2oD/qqBlqzRMxyoOOwSabxv6BnHz+zMiiqqzZmwQzJEqa56pTbKARHp+HPYOkpAz+LtEw9k1i9Dt9YthR93RemZR5fROzV5RRBvXiaDwsoi7MsRn/IJa/4s94slKAUpqe4BLOwi05QjwcCoC9yII9lXBo3FXdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321089; c=relaxed/simple;
	bh=c/DbwxB00h4bCHsVWfXDLZ7vX3Lz9v0Rhy2xTpHLGyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7o9x7YexD4IJFVVHlaJB/Eye21ahyOdjntUBXGVq7LaJ92rQ6Z0t5qqLmRvANIHg/lU2caPegdqZZPc8xKqRqPbfmuIzv8jcjoG2ZLXPicLNRnU7R2T30mZuhKUrbHKxfcuKKdZCMCt5lsLAKBkTtXlhfUS/6VliCO+PSvrnio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCshpbo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qh3p9Mvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCshpbo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qh3p9Mvj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoqIr2467509
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=; b=cCshpbo85Wv2QZuI
	NTN4+1+Kyw9hs9iBPlqLfuzc3r2iKHraIplqT4n0XQUj+5foLdfjio+NPfgAngnX
	I2BK+oz++APhQ01jwv4H4HbH9uiukhgETZCt6JlYkyRi/8YbKBpIXjIjx0IAJ3dV
	0x4p/vt9R5e4MNc8ifpbFEONWVRboHpdcylZCIZ7UvRWyBdUC5aDq/FuE5sGCxEq
	JKH2GaBHV8dzduhHuHqM5wLfOrd085KSe1vxBW5LWv3Ye20WUlyqxlSITifeCRP3
	H+gCaq9ggCWFxY+8wStOZW80TmL9BDZYsUL334koWKmtJhXKOYSOAueEVmjJ/jVT
	2dWtFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddhxg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:04:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1505974a91.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787321086; x=1787925886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=Qh3p9Mvjh2EfxHU5owKXhMxYjFyzlmfMIm2d/KiMCZZ6dhyag7dSdbrNFDrUFycWoY
         yvOuP8UivuC+oDXSQj02hSAcGJIlmec6YSNwOKyFxJBGYWDX+8WL+ozMOsxLBuHuxpA7
         SUfRnhOtYJE99nf8+YVZEq6y6QCnxG6lViAG159Kb/MHWmwLdgArnidthPKlcaDYaEaq
         oqjmJ1f+cVxfojZb1SNxPnsnulcsYVnhAZfBh5bb9R57orA1MZShQ8aI7S2ZLrjitBg+
         ztsUk+God9IXMlM47dFjq6AZWmlWxmjGQjomEG5GaywGUOeO73SoY7tSRP57no1kSXyQ
         1uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321086; x=1787925886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=Y+RdIpckm4t+Wp4XZ69ERv4LYjIJisf9pV6+8IQ4RYHonv30Avm2x6v8AcRhTKh7lK
         RGAY/DrHEQz34xarpAncUmBcQ4/OA1eh7MYte71MG19pCvgAzakNnq89q4aeJ+6Q+fRP
         Av0VNTsXTbCylOjIvM7bkVL84WZM6/awN6s45i3QpHWUmeqGUhSoFcV/XtsRlax5PvBW
         v1fHmKO17FRRU6pDWmOTzMExYC4jLCWhxaybJpziGm9Xhg738W2ZWYqdvwLgJbmdu6MJ
         X7DqizObQjJWtwLvmzqyFjSTxALmFC9HF0+LNdR3eOBhvD0cD8h/YNY0Y7PdWhZjR0Gr
         1mBg==
X-Gm-Message-State: AFuF++mvNIrHbIbAVy2Dw06YkbiZNorOzFZ/47oVyUcPswxNUXHwloOw
	6Wrf802/bl4wgIDIJy85iUjS+LHtkurrh0/HvMz14Qo7fBkxCJmXCAXayRZ/WXstol9HD4uKsfl
	fs3e05YrR8LinLNdFYcvM2vDdmJXEVjMUfwFZITCO/gtUG4CpZSAncyokkmWeyb8=
X-Gm-Gg: AR+sD12mfRDTvtFkBja3KItrG5Diqmf0N1nl5VJnH2iIla1ZGXLrgvVx/ki6Qq8r9Px
	I8+Y7tvEzyzgXCSuAZV0+kU8DosqHNOt6mUWvKV02RpdRpLjgwLaQu/J+JvjwKMyreGD378j4CA
	3zp3K1Rss+P95trPCfZVQWyXOGcfvJbIWKLdFK4JklzZoPivV4TQ28LjhuxiMSyZJsJGO6Y3sfj
	5ZDYRwN2SvwoEo+f7bLrpplXFDdEQmpLWdJSQfk5+4WtftwFQcTh7wogoIY3R0GwUu9iiHttYbk
	7zPOvgpPuGMU+o6lYKtJu7GNgyRRNR6Vx+Iz2rrvdDHXR6uLaQRg1+g1nQg07vJlsdFpBB75hf+
	Wi5Xb7pc7VfP6mLjfBtB7XWvsjbYz
X-Received: by 2002:a17:90b:3149:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-395c33ec565mr11897746a91.4.1787321086126;
        Fri, 21 Aug 2026 07:04:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-395c33ec565mr11897634a91.4.1787321085588;
        Fri, 21 Aug 2026 07:04:45 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c45530absm3331680a91.4.2026.08.21.07.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:45 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 19:34:32 +0530
Subject: [PATCH v2 2/3] usb: typec: ucsi: ccg: Add support for
 cypd6129/cypd6229
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-shikra-usb-dt-v7-apply-v2-2-628885fc1d0e@oss.qualcomm.com>
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfXw1Z+VN8gTVui
 tH4fO/0OswsimhsS2stKAn+pxcTwho518uzdjhiht/oGvwpJ/c/5/bJ77i+yT8acqjagSDGAIHX
 dBjYlePYLctNTnMmUiPjX7ZUi0nH5vM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX+lJF+UylX0UU
 o8CbLztsmy7zOFtV2NLxBPI/+1bbtLd/HkNneFZ8zRwXLuHiMBTGyGleb5YMEqftXKrZhie+phU
 HRsDOlTcKO728r56aGXPddlHsnzr/7VBP95gl2ueNmVYUeNcsnCBQMmixgRH7SnvaLz4Mo87Z+b
 5Ox/hHJ3lwe7o3wWGjpLBWo5irlgd8orGezDx++5/1PVdZLMnpV2ybgrFj+OZGtcLYwXjcR4GGW
 eFtrK/idlYmfAhszpMO+LujjcxJFkj9XBcb9zk57Ue+d63/Pqak1/4d6nHqGV+ECrrz+60kUDGk
 /aI2CLNZ1MH4hc+W5cFQYtjHMHya7qvZfZtOwq/vQ3W95isJX6RRgXdgEKrMBdiN2xH43YjINsI
 gdofHniBsRq7dqtpaCd7KMstgXhhclDwzS5e+N5zWqVJHzd36nC8p9Lni8iY5BNEdlAgQbku/2j
 M7RsxJDwG2NYPkCpzZw==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a885aff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5ttfkXOUkHmYICtgt44A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: l7iDuQsE7UmrsoiCdkjv0LPCvCJS8ji_
X-Proofpoint-ORIG-GUID: l7iDuQsE7UmrsoiCdkjv0LPCvCJS8ji_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210108

Add cypd6129 and cypd6229 compatible strings to the of_device_id
match table so the driver binds to boards describing these Cypress
PD controllers in their device tree. No other driver changes are
needed since the chip is accessed through the same generic UCSI/HPI
I2C register protocol as the existing cypd4226 support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d46ca942026e..37b96d662e59 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1527,6 +1527,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);

-- 
2.43.0

