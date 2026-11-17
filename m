Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935343;
	b=1w6BRK/fIjQb7DzkLWWdSjeFP6BLHQngEBiX9BfLkt+TF5Utf1bCXs/UY1UWV9wG8zaQ
	 DN91xKyajjpmaSwWlPrvJzzqC+EqKsSdVundbbAy/2mHS8/T9/vA63XbsOYn2KujxLF19
	 6VA+HFnyC6pAiC/XCDpNIHlpF7n/fBw/W+uXZjAiFQah8/pHa63iFO7zf6DJ17ZQgWb6s
	 YNTsaJq4rol3mvnHb2HZ1YADRrGJfc+F9MRoiihvpdqvsg1xB//Y+evl/Qu9bCMfnzwUD
	 9w3nRH0BFIO4FlYBi4RpD9sNAZ2THQPN+/74oCw/5bxvtIeThA0ODFBfswrgfJxZblA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
	b=r/TBOCkP/aLxlKAnfSCj0bIVlIpIo4dvuPfmcpGvqGxzu9jua2DBjgzV/HrW2wF1TBje
	 WfezefFfrk0Y3zbEG2VQWvK5gSLUWDEzozhHZhv3bBUA3jgU1MHVE1hAfzYQra/tVJf82
	 lh/fZ0H3t78AVrFgNEBGdI2jfIRR3tK6/CNPgVfUTre6YbNWB17T8ENm2g13qeSQjldZO
	 CLUjLwZrs/GPpEICBdaYlnApU6/f9HXY6uMIqztCEkqkd3cBGSPiSIMSlnCRZVDts6q0B
	 j/fzRVF2LK0Gf3Ew/jQsQHrrtX9Br3Cg4LyWs2t0pZaZl5S6QHYIjBMze5PE2MeMs+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEFE606A32F
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEFE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHGJxsk617421
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnW
	PeKrgISM=; b=VvQrKbg6YAJNRoLqeywxzQApdWHhLYpK3IWofb6bDkLhFku8iEu
	7HSUQfW300l2xR0gzH357+e3ETlEj2OSzPdHLe35Hl1avAOnZVzpkMkaDchT80Rw
	NPtNoTGx8ceJG4gYBOmMlYZtiv5u/JKm+U9CK7PTsjp0skTxX2ZamzzErb5f8BTE
	xE6aCZIVdWl8yIEHbIpls5Lby7eKAHt4WXvkpyez46VMeBo/5fPI8+xK269BBj12
	r6/xa6jizijESq05TOQXM8bZbyNZsqBHDdldP/VFkm+E0Jzo68tYbWx3wEZNh3tZ
	QZvKhS6VmXb1T3WUuAbJNqYVnSeU93VsbWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbu88af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3821eb27024so99841eec.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794935342; x=1795540142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=R34SvqJkgmldOrBZLin3eH9Rx1JAtQAtPmQrFsy91mZAvGNyqWMUFectI5DAF3Vg6b
         z+q++xN9pHSatGU4g4XWzYQFIqMu8aQ1h0gItBXFhk1LkHhEqbtxN9b+e4yOHp99AKsc
         GglvDe6Cxk5M9xpcvFIH+Tbo5t1RY1RaxoJEP2HEZh5XvuulMEcgj+98G4i40PLD1+Pa
         Nh56qYG+SQYlPonimAlNqrQljjoZB7ECUR0sI+eqdi6bqyEr8dThwL8L4WE3Ea/+Pa8l
         vs/CfwGt1yxFGZOvbIxNnwjbSmecjh4BLnugVgp5eVvG1p/3ZXXfVhxFf7ThVgwrCf5X
         iXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935342; x=1795540142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=qpNWabEq8x8kBBMAFsN+1IYphM1P60gBvIO6s1lowpuxv9Zqq4qJ01GNk6PMm6bERe
         YvytddiKcSkh3ZnUr0uZ5G5wCQ2J1G/2nRxnyepw9OkZzV+QGlILmn8iJ0LMPKbXkz6P
         wvZmHl5XxBHT496X4z4fb2+68Ih2qqErGx7JgpckEnRWzHZnHt5hJWLNwQ8H6r5Rv9bi
         NgK/Ich/ehj+UkSsBPG7qrNBl1ElPsE13tuU/2yYY9T/muPjkDYzglNrUlX42nzE/E8l
         Tplutd6YPG67QIg0olF0NZGIbhRRIyOkrEUwGUFDBXBqSL0lxiiVLxfLC1I+MktTDon9
         ytlw==
X-Gm-Message-State: APuU4Z/ZMP0tVik6+e/IeNfJ3R3MPctDb2mur1k1hCSZ0nv3/PJUhdQj
	kTVMzzJ3CouQsNEXVSZEfWU+Zs5Fh0UZIDn19GKWeddkVZ2slYasYPdvWutmFtsx7wr4+T4A7Sz
	ScgedtQDTgv1OxgrqSGx5+jU5WqYnKyonAAeYVrSCZXPKTm68zgC2YrowgbCobtojmP/YIAk=
X-Gm-Gg: AZFdTZcq6drHBUAbVOje6ZXfQRnrMtUxcQ+AAd2VkvfqF+gaza2UbJ7KivF1EEaxIsc
	rqyQ3GaDBC7Pg+FHYM8qbjF2jpPmsH1I4bGU0ke0OYwWvwHaQyzfbhzvLZ7YrmTfzenxbrbMnw+
	texkQvfqOH/OEahzheqBvkiWMA0GSTtkW3uqCQF2fyHCoJKgCGx55+hROSEsELKhV2GJgq2EIiQ
	BfzBV7lGsXS94RW3Sod5ia+x8mn6tTADAVf5sjq+1Lt4Jl31R8cvumE+FjNAu7pzjWl2EAfsbcV
	uOJfz+PKDEdxTAg6BcwS/igG/0IMYo+41WOSTuVRaw4DW1ttIMJUvZr564mclqYgca3Os92MH6a
	PCOO+FmPcGtTqAydJ6PaSM6E2vNnlgSN57scj8yz6LUQy57WCvzPBz19Jr75pBf7xofZ/Fwytv3
	bh
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70416eec.21.1794935341330;
        Tue, 17 Nov 2026 09:09:01 -0800 (PST)
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70377eec.21.1794935340795;
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm8859876eec.17.2026.11.17.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power domains
Date: Tue, 17 Nov 2026 22:38:30 +0530
Message-ID: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfX3Brdf87sZ2MD
 HvlubuEV16A2Zp9N+Tv/azoEYoBQpYjNCGD1nLqoJhTLopOJmLlVi30XBUqYc2Lzq3IRd1eM8HO
 0/oaP9bfbzsbmm4Y9bf8A2IjVvIvkhVNBBnMaMeeiFYgk5Pf5O4IudV8IpQOshJxH7S+MstAxE3
 F0pR3jtpQvsKfY8ZYhzW4byGhzh6kK3K87ht6Uh6lq3qgtRExTwGw4YPYz0wAuZ5BRlNifjKcAW
 XlGsBrStY+ODpHIpXKIeY5F8EtFubqJiQ3IgXUPDbKPf5bIdrw0DuzDK0Hc0CHat31xmyPTe9tR
 r0hY3UdvMSPVezdgcKgXiDATXhMBRpTNpAIfkhZ+daRPkLnNFBPasjqwgOTqyaQORBRXhMPIyIn
 IGqrGkjbSgfRDf1Hy1O1rPyOLnM373l8gvMCeS4RuStbMYaEcv6in9bFAIpnQmw/kuOvqVa/17Y
 lm5gXBTe0m6CUyqcdZw==
X-Proofpoint-GUID: tYcP3_J2ABh8wzy1cmhMTnznGNieiQzJ
X-Authority-Analysis: v=2.4 cv=FeOiV5+6 c=1 sm=1 tr=0 ts=6afc8a2e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iCUNF_J1gHVpXzmuRuMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: tYcP3_J2ABh8wzy1cmhMTnznGNieiQzJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfX2z3j4d8T/xAq
 Wh2baMe/hii9xyPZo6MRw+TTZ1MMrQdIlyvOjhb4hdGi3rcLcaOzpWJVILLQTRLIXZyYtkiIb1d
 MoFCnNtPYrMwCM1J64OxE7+oh96OFFg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170068

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29..4f860985a8fa 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4049,7 +4049,7 @@ static struct gdsc gcc_usb20_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -4061,7 +4061,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.43.0

