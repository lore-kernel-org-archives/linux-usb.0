Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719618;
	b=kM694jVPhCsCGU6LDno6iZ6SV/HppFRC2Yf4dl2ifPsF5KPwKJyWWdKTQLswKKAuAIIh
	 IebxvFBClPrzmKgQixtRVcYrIpnfnHq/7Iflwrr6/0JoC2WoOdGjy9uUXh3T2WbOT3iWY
	 Eh2iYel1j/495HemQUAs/vTvpDGYxRGCkvWzxnwU7EXLhs0nkw4k9TnUGSbzmz2ulRoD5
	 8c55j8h2KeM6+9gc6Ubx+cVePKkUx1lZXjpBVnDc82jtZkhsdgHTKe/2tBNE1l+hkhGZz
	 eFnc+DMAxaNsLcC7mDV4nn159B+zcCb4YQogEp+kzLHmrI+qHytriVnUw2bIwT9rH4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
	b=s0YcnnvIp9oFZEXNi+mvtXJOLq0/ksf6Lr7SFp8phHHDoUQkrcMIWSCo5v0Ts7tAnmeH
	 q5j9/Hqzi8MO4BSjnTvjlABdrwfwHoNPCV373lRFu9bOhvZpk280TknnVC8+Mh+v6AcdW
	 SGreO+JS5pQWF5heGRlosHCWGnSX5H4BHrE8DRmEh5AyRF7tRoVFCJ0WJmDnGO8QhjAqo
	 SSAqVOqdiuM19PE2OHseL534T/FAYAnhLprMzPG09iNA0lRmGushxAif7xiugJCch+Joh
	 exNlTEYPJ2R0YsdaZwu3NTH6bkwW+8V1GO/YaDaXewWycoD/sEnIdslOqwgw2D4fPZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RORMn7lU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMJCE2rC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305E606A323
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E305E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RORMn7lU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMJCE2rC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuNYg3750277
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=; b=RORMn7lU6cjZUu9n
	rBkXpGhdt03vuQ/8JNw4HTz9VLUfhi8wsI2OrO0yC7CFvPDJaBQr99JQ9Bcj2Maw
	CT/w6cFZfk9zqdByUUNYzlqh88xjQ0OzDisuhWy6SUrebwr8Ai23u54uPukPiA9x
	AfDDx6k8S+uVwPRjvPBbbh25yEAr2EvqydMDhHCrf4opCii9eacFe/AF2aP+icwM
	7Y9JwUinzImZi5wFyvXuImg7fE58GMr2r7OJYntRjSyEXF4GE6dqIqW7AZvjH9yO
	9Hbz5LrBu/tXvxH3zEGvSSxHaO0w64b6/dzvvTR/vAJwoXuktMm4xitYSG1vI3as
	qnS6jQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662scbx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso3486082c88.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719617; x=1796324417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
        b=QMJCE2rCNiZ7x4yyLqYNEJovvunwd2ufbOBSl8DyoDzcxztnO4O6+QEEPvDi25ANq4
         upa6ETqVEqpz5m8KWRFouXu+1lzkAhfMnEeg1APfdumkNtF5u3cdovvrle/vJdfqxeVg
         Is/74IyLt39PWWuKXjmuA+7deNTWEKXi7iUVBy9+E01v9URiUsEwaKSsKVTi9SVmJroa
         BU5o4TTCIp9iEpIhjyKgL0vNzxD3LgAOxFCueLypJlONJt5Gn1GNk8VdI1JpJlSvr4FA
         Cs2RPfgqp0+a9UOa3R6wxOq77CiDVy/uL+dGAnBJz/qzNMSrNT/3d99eONIDvv62DVp2
         ulng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719617; x=1796324417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
        b=LZ176iPHRS239qKhvg25X1oYderY0+rOQCY2qnforZJaYyaIZfI1ywua584L/tTjMO
         T/XUqZDZI+fpl5Wb+Ct2XlaabXhfxziN1BNBbpBmcTo/fDrzpA8h7t6SpVJDFPcKgOH5
         BAPefCqJfv0iRaa56tDbuNCRRMjgnVD2tPYMV/dIWYfUfWYpUD7G4+w1NC+1BfQtZvHp
         OPltkWQ/l10pLRVmC4rpMZfb0ncMwQvhc4kHhBF4/bHbZEliAbxd1l3xxJTGb5LXmkjc
         fode+gTmVOcrma+s81ecafj+Jh8UeYydegXHVKiutF8xHWV91wDAHZHYm27k/Jw4BtPv
         SAiA==
X-Forwarded-Encrypted: i=1; AL+hErG0D4GVQj9hpV0mBt4d3tNPRhUaQS04FvT+AUym2c70lhks8WQjdgQ6hUyAzhAdO+eMHmrS3KLjyys=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZwyNrI98Z4441Zl23WY/jZ0SHVq45x/yho7CeXfxrEBD/6z1m
	IUH4xxyEDyqYvgLOzbbywYoMAApO09dXI4S+WvJupY9sP0Y9gsh0I4e0JBN3m+FGFI2hGRA7ch1
	sFNQBCLhGlZdugMhta8cBZdFY5ZM1B13dcb7iD7APIjFZ0pEOhvQGmP+tNFYtsCg=
X-Gm-Gg: AZFdTZfnvaFSOHNjNzBJH9zXHKsJ5xU/84wz+sJK5SZsOH1UNPXW5Jia6tnFIkDMh2b
	IQ/Sj0WFik+gR9pXM01kNc4aDgOddyXnPBx8NR2C9XO1hHuTHmovnNq3egjfqoSIKSWFvnkg0q2
	quz0M+iMbCgerBVeaMbPiC2JkwjbaWDA2/3bunyNdT5Eo8+a97TR1zBO++1m1hfpmBdPpT2UWjw
	mKErCvstdP77ZIEQAKjBDxOlKX0HkiMezO0QbxBV55cthqRnYIoeSDLmGG+4E9iQloFblgAHFbW
	9FvrUb/VzSIBXaz5EWiNMAIeN41pnkZkmpuRpZMlADEzUoVqAgMlgtqLWwzAETDhrblnJdAtUMV
	Z+900b1RdvQxVth91H3K1y2zL8Rvrp8kynNMGU1XIFuiU0lFgPHF+kXVYu7Ym0chOwbp5PI4JDl
	KYusA4
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr23745132c88.31.1795719616390;
        Thu, 26 Nov 2026 11:00:16 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr23745075c88.31.1795719615743;
        Thu, 26 Nov 2026 11:00:15 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:15 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:13 +0530
Subject: [PATCH 5/8] usb: dwc3: qcom: Add support to keep GDSC On during
 host mode bus suspend
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-5-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0881c1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=g78jQFkTSXp5-VZghQ0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: qCdioiLNXy1_be1FCspR5vOb2l3kWhFJ
X-Proofpoint-ORIG-GUID: qCdioiLNXy1_be1FCspR5vOb2l3kWhFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX5ZNiiY3KP3QS
 B+ofdnLxHUEyOkQLlmjhc824SvDN/MiteyW14u3/2YmB173BnMOXCscl4pWVENlsgYhfBDM3ezf
 1UsF6FhkEP4kxUUz5l9i1Ny7rtaZf3UM7zhsbQhw6EXmqsjtaOMTQvzDD8ikm3XEliG0lXfO0/u
 bUc4P+2hs4p2FVg7D1LD4Lhg02tYA8pUzHdog9rD0HnuCI5jDrVD/Fgin48k0PZKxYCvMgR7cuR
 zWuZEdmiaGhAWCs+Fz0a4po/qLv5sT74GAPD0N0ALsmwW6PeR6tpinEDPCjWp8igZs3Gfl1fXMH
 9v4XQ1aPnq1CyxX0d/dCiPfGEX1lEM2kbp1jnx7Al+7hyENh4VoSw1/RpYHX1wLYZ9lmDt6//y7
 R7pOutVUK+q+vcCxBvTw/TeLLlA9oOYlJgltCT5XYk5wfozQ/txh3eoxKA+3Wjh1YSAvjU85KeO
 38bfrgRoIw6rbEAeDWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXxl+cb5PuvonJ
 grehC4AGe6jMQUDUdOogIroBB+9YzqETbm6Ng2oTN3NpwnztvfD28pWN2FyH8sN7WBoxl+BP9i6
 UM3XGgG8WT15TVrnhxaXqqdOo8kdzuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

When we perform suspend in host mode, there is a xHCI crash seen on
resume. During bus suspend use case if the device is wakeup capable,
the GDSC needs to be kept ON to retain memory and avoid SMMU faults.
Set GDSCs hwmode to true to keep the GDSC ON during suspend. And set
it to false to ensure GDSC is turned OFF during cable disconnect or
non-wakeup scenarios.

Co-developed-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 5a68025ccea5e5df8860f540f718262b7d8acf8c..99dce28dda065583b91ed965d917e977519cfe58 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
@@ -391,6 +392,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 		for (i = 0; i < qcom->num_ports; i++)
 			qcom->ports[i].usb2_speed = dwc3_qcom_read_usb2_speed(qcom, i);
 		dwc3_qcom_enable_interrupts(qcom);
+		dev_pm_genpd_set_hwmode(qcom->dev, true);
+	} else {
+		dev_pm_genpd_set_hwmode(qcom->dev, false);
 	}
 
 	qcom->is_suspended = true;

-- 
2.56.0

