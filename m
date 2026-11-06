Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957852;
	b=D3fMOMw2/Ufk7taEW0YPUubQoSQd1WJ24h1QGDeA6z09oCOvcQ0dOnncEvI3mGhLxEQP
	 JChbig+fcKaJpuC6WmxSCvM+OomBQGjvhDqBFVwBpoircFXWy8xojLOKUaYrE+2nlAjKw
	 2zKCtaivNpMVrmf6S8iBdKlba43cvECJF8sLBLQcBl6J7ClN+Y4ekE7oXS0DtQb1PyzdF
	 IHRoSBRqOAXXHBPvby7aja+M5QPsMRplz7QncmwTPuEN1xufHBOcDN9ADIDK5BPr1nQrv
	 9AsmaJs5awhrYxlLv+XVF9UcTls9PyqZfyKvtojserfHS+JxIFYnk2lusMQmbTihxeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
	b=FaFDTySfVUfqiSTZ6OYY9GufzSEiiG/kQc/JuhKO84+i+zcuu8MOewOh3EYHWHxgk5T8
	 pj6o8dDTFMkzw595lJf9ZMUjw5gbcRscMKFdefETn70JNX5Dtph2utQjzioVpbqcOavio
	 un6B8syavVggMyIL62PcFoQH/mhQmz0Ll+30SkL1jmghZ0v+n8AG74jubP+8BzolHAsNx
	 BN8VRP9LWMgF13ttr8TC7QYux4LUxPXNaWODWp7uriT4J98dqIj7WEjkIllvNbSR/6c2/
	 JetkftgbrDYPcFOBGlXg1X87aWOUg5N/v2KAfkmeM7aE+UukHcHyQic3E9LEhO04vBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B21606A332
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B21606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RNCN2933608
	for <linux-usb@vger.kernel.org>; Fri, 6 Nov 2026 09:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurE
	LYImyMjc=; b=g7zHu4ds7H3HSU/ADy0o+QM20WAsN2sOChWdy1FcSmYrOpDbZTo
	4TzRMXxw/dCzY1eqIpP81aSGCvcG4hx9xNLkm5YWoQ0qAPlpmg5ZHqLEWeGkC2gB
	biyGY+c2ysIDfVQPBoNWr5QXisR+74MC5N4BoP97F31Gz9i+H4IxvE8WOjIWkY9B
	3iCxXGx9jQjCTt9qPjLkQ6rUrQaYeHrmU/+wLhIPHQMF6mFZ/9e4AkUL1KpQ1MYZ
	tg/S/vVB8JRo3u4vcPhmOkh5m5P9HE7cv0+MQC1BDGYZrKQx/oSahxHU+beW+f4d
	oSAD/82avSSv3i0VRyobW/OsqHbITB/wIRw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa25w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 09:37:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso591185eec.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793957849; x=1794562649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=S3u+PiwUSZcNHHw63LW2UckMuz2zFqSAWWQdqOpYPRjVSkJvrRoZQTkBQoaq6aGSXr
         c7RSavgVKEvdAO2U6ZUvLwLFtaJ0/+bhblt9goAE0GlJ6rQz5/Yl05s4me/AdTd0Dcj/
         WaFjvB11eTs5N/5+6fbSDkKFI8TNlOjibsLS0FuVIh4WJfvUK5wKSeSGq2KH5lQacsG2
         F/nZ7/4ThsHCYcduYR+UrjMQHl0Dj0MigfM1RZZ1FpO8IrB3sC2gk1E95WKASWo/GGO2
         dYpTFPaL6l6epmTJbtuX1afG8VyeBimthRaTjXtRhU2XhIsLAbBTt9dAHrVpLH4eMvkJ
         mIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957849; x=1794562649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=Y33y8BMUdbP+Ov0VAzAzoM6l7nHarXSi8jvV0Mg3gP1fCqGuXeAv535NQHNSBFULJ0
         M3Jw54zYkQzre4RSha8GeqUYNi3gZirwoADkCZwHTLFn7kYs5bC+bKllsKiDqpKDkYh7
         hVodYuDj2j9hdw/hKTqgNXfe/z1Nj3kYgGv8Ywp0ED/XXxFHpJPRNVwV3ikPCnu6XqPB
         +4BlgMMKwUaxQw1q8L3lOkZuF8dq/Zi6dESKVwru1paRERv7Co2Syj8jUH3oiG7qJLvK
         W4HvaUnHYqvcVWlpfxgwpf1OzWKUQF5Hk7eR3sm1DkPlA0ciODCECjx42MIjYXNwv4Ks
         7Adg==
X-Gm-Message-State: APuU4Z/wlgx3LDiJ0YFQ3nIdTaXa3Y029jeafSpYq1h+wreYnOQEKjT4
	qBQHa2uX7ujJgespAaB+Okxtxpfa38GnOiN7+UqfVDdfr9cbdoF5t2Ypz4ToyOSMWBLMBH13YNn
	Qvp38xb/NbMy9l1Fmh6MzMZkfNNwxUw6D2dKPG/t/4rI6Im7C+mrd4d2h/CO/bUs=
X-Gm-Gg: AYBFou2Q7NBfEeh3eZSC2FGaRd5tl36AL1/mOjfpeNi/RvfcoL/ZscLRNYUFSynKEO2
	MCkIUrJe8S3oruY/xvTsyywTgcX/PTE+kMpVrVl98Y1oRnLjJafhKcxI2BUsap50q12BXPxE5n6
	YVAIljK0rwiL7YkX+1IaTyitBWwknJmhFHeXYeTpWo0jGgU49xVOIAMkuh4CEgf4qJDviUwsahX
	197IhEyACWO0sTokbrYj4mTUmlAU42fuGQnWIr2brX449YS0NYCR4zE5ftVZYNULcD5gTtxi9gm
	iNUOGA/EKFPMFu5UaGUbgv2MXZPuKcFb9EL4ZrfP1aJOBXFQYxfyUssjZT8SsMal2g0sJ3xWQp7
	UDe4Kjz7eYZytseF3/QnyzT3OP8Ti/YP3KeWjXA4/gFXABfoQXc44k5RwnTNbJ3+PawEcu4BPRn
	JQ1w==
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691298eec.16.1793957849265;
        Fri, 06 Nov 2026 01:37:29 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691259eec.16.1793957848748;
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm10548494eec.3.2026.11.06.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sa8775p: Use retention for USB power domains
Date: Fri,  6 Nov 2026 15:07:06 +0530
Message-ID: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-GUID: t1ch6Fv-DrWVyqQYMwMb7YFBL_ggGtR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX55ZSQqCzxxyh
 VBkoBf7ocPwQl1DovRV6j1j7U1thQbvjObU4kmSBstMAXLYXSX22gEoA6OKL/+GsBoqa+LGVOXF
 ZP2ZMu+/1imat8i4PaKcuUJnR63weuJKTMn4xyOXu0SC2pSbxgF22rghm/dbA0uuuiTu7LIDIue
 4JxqeJ2XlkMvPfmg7BDNhAmRFxWwK8FDugXnvBJ8EildnLSnqK1GWY5dNZkUiqhGCeuWllppI5y
 Tl/2vgq3lNKdIgVuH0BWdjWz6XWHbWLCP2TY3za+PeoYEBkChxAxavMfzBkdx7KDEYfPkfhiYwY
 cUC5HzHxKkWdHKx2N78ZsWK6VJx/oBW6OoJckvMMi0H1MJQJLkQdM8vgH7rY3GNY79hkcsRVyRX
 NmGJanMJye6dzn+4q6fPkCNNiFN5pNOiH9Zh0rduDOXXhSREhGg7Zz/mist2Q2gw1vnopKQtpho
 j4nby4xazJAHVI+6TaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX0P0igh+YL6FN
 vkO4gsFD4el3/pY0pkJ5WUkK8xN3EBgBcNaWWNJuXlrnCHbMS7Ial8hNmUNFq+348LPxn9GFQc9
 8NMBz+itcp/SapHckKf/nc3L2NBtE8o=
X-Proofpoint-ORIG-GUID: t1ch6Fv-DrWVyqQYMwMb7YFBL_ggGtR-
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed9fda cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rGLbVbw0NfjaWOq_wPUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614..47acd1b58f13 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4260,7 +4260,7 @@ static struct gdsc usb20_prim_gdsc = {
 	.pd = {
 		.name = "usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4272,7 +4272,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4284,7 +4284,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
-- 
2.43.0

