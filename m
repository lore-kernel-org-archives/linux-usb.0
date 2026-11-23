Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458535;
	b=3gOlGxA2BQ9a0E9GD2AFupg0AIUaYzzI0bilagTqqiThPZWTgO4URDIj5MbJHS/7T6/g
	 2N3M5hXFHtuoNSVet+PyY1Hv8nQO0MRIg5/hy/9fpA64wvDV4TTlsVpoRX574hzgmklkL
	 07CH2esvoteS3IBvp73nuOOFV5zQ/pUumzYoPiFdWmv0wytreCJmd5Rs8+7lywNZYo/Hl
	 PMMlQyGADTF3VjYWsxUuzWRBc87jAtUKL4tYkDgpkJIpuNqpRRErzty9/WDy6lJXrySY+
	 gLYZf4/O91LqrBdWzeynvKGJx8L4C1CIlzlVt2Y0XdQUDFn03ikf0pCtYBA2zJyy1aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
	b=1c6sPxl14CdGlIOc3fzE0MaTCE8YjxkiEoB8HIVaTSotwNQg5NJtmjkYLvYxBpGsO0vF
	 Fx+fe/MY0BrgGZ52cz9KMarz++Wx4lrvOqSrwJx1Hw2p6fuhj5g4eDdW6WPwywZddCIk+
	 pZqGHaKCuQXtggZ7qrpyhNa+pWfHmGy0N/+vdEejxrrh23tnERvDA3UbjSjjGj5ZsqWo0
	 qefGKknddOijzv5N9/4lp4zovYP9shgz+CpHOdIMsJuAOTjdGfZsu2k5mjoZgPJREKfz/
	 Kw/sH30C0vOLJ6KhIs6BJv0swYikHQos3ZaW0Ikrnv/Ra692Kdw+No4JqnaP3H3lQAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HTazO0L/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad7lawWC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285D606A6AB
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7285D606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTazO0L/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad7lawWC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGqiP846511
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mHv6aWy9+lF
	Zys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=; b=HTazO0L/4xlBhQ6odS5L8MGOK+C
	arZ5a1Aqn1dfk+LQujZz99ozwUsdHsPLukuDsQr6wrsIecKVr+5fKGI6VYsWBoUu
	UElYVXk9/SVBbHthdoLfN8xTK2SDNJkV955aM3xkDV95tEisEOzbQ5olgOOLsEOV
	zEHvrF3mCX33gXStixKEBCDd6r27iUjLRxI6vu0yXJgSRMRscnmYS9sj8L+5Tx0/
	BUjzJtoxeaNMlt9SKPrSFDjQzUvwU9aS+Dk3h7mV/f80JiNj3DQfj0PSskNJv5pb
	f2M0cjOgMb5Tj3nBzN97dwyXlv9UZh/uni/ZfDmLAUcTwTDINm957Athp8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742uub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so5868251eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458533; x=1796063333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
        b=ad7lawWCPxHl7Hs8uQeqfZBmzeiLC3sPBGvYokv2jwEcy61oekTUcposrd9mx8zNPq
         KUcshBSurYF7npYAxHkjiyBqX3OcBfUDdVpu57y574EC+HeiVsATcbrfjNhZEpqYpnGY
         IW4JRUzODEZc29wCnGKpzUmL6aAQ3UHOhpW6TitSLBPTRaE70VPjrubh+k72HdqAYT7x
         aItWWxWf2ShE6nXiKeAiBdbKxWSI7AEx+t/YE2Qvim518F59f57SpI1Hrg3HeRP5wQcZ
         9uu9yFGEzD1uCydUnvWEkQXwejbL5aLaLT9mWMxI+STqNrbxIiMFiJbDJ7/GECgO1bfB
         8teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458533; x=1796063333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
        b=2a1tcfYl98HNvTAXWXOSmDFWykz5BSyLHA1LPpDA1QaOltgeYVvJDM0FccVnls6Qcy
         As7iWUtHXTFWpGS0A5tBoDpFTDl5KjSXugYt+lWY2zXKNei2kcljKb0q/Ga4xO2rDZen
         Yz6OP2qsYyiKQCJ3UG9J9menpq/hEzTiz6ithTeLaVot/4Oq8EMOGKC2g4Rc4eUOZP7F
         6nIWJplYB+mZ64FEued45d2N6vRV1OpCda8onlduCM/+K/5uxcDljS5deYIfs3dZcFkE
         VMcvijl5PqoztWaG/tzmB72V2XAo7hGoxb5weAWkKD8gmvT021ysgPOPz7qLWztSnXmq
         1RUw==
X-Forwarded-Encrypted: i=1; AL+hErEHbkWxZEMczYeKoNNVzSAzdU2/TseZiGDr1C1nvTNeSxaDgbPsJrDbDtLAgzJozx1g+8q5mATC7qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ljxSmUffTzNFwz35u4RGrSNMKOseKK2UEDXAOxMp062l23Pb5
	P0GIvGjK1QwEvmVicS6foeB6E2spJ3WNd3kFwazrKum1z+uiEfG9FvG8bapXoUUhEFquc8LULss
	tXtMVVOFwTXcDUvx3BZKc7yqOpCqfYrw4jnqVAaFYzBbq9qLPnDpPlQtxcL6Zi+4=
X-Gm-Gg: AZFdTZf5o6j0WN3WG14KcySNyXAmVEroQLWN9EZsuOqUpt67U1BNf8ZY4HMh8zf+d22
	yCrT2I//BnThTqtJgwDXMF4UiqOJF78HG/y38SaCz6MwgdUpZylOFp39dPvgHJmZ/yzq1LWw5SV
	WhqI9w3cYWfXnB4BqH1YIJDiFioizHtT6C+EEq3h0qY/91Rispeb25XbZTMAygUAT8NEqh+9jE2
	/lo9DJX9mpA97vCCh47qd0OulxLYRD6DVixGx9mDAnc5ps6Coq0D2d3Rwev1lPmOjqWUsQFVLrK
	gOFyjah0V2WpIh0QAUeNeDLjEeKbWgVGddSa1kSAxvSHzUyTAykHpSiYboJC1id0z0toi3fdq+3
	/ehhs7TiXWv/DgY4FcBvPY1q1ohvniOO9q+Z3vHKpoNZKzGkEyU0R44Xq64WDkPBimcuC7/wa5w
	oeSUbGr2/gnP9DXcLI4E8r7jjzQQ==
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr5145936eec.1.1795458533220;
        Mon, 23 Nov 2026 10:28:53 -0800 (PST)
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr5145913eec.1.1795458532595;
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 3/7] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Mon, 23 Nov 2026 10:28:43 -0800
Message-Id: <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: Lw8iOsMl8UGJTdfYIkK9DJywT6p04Zet
X-Proofpoint-ORIG-GUID: Lw8iOsMl8UGJTdfYIkK9DJywT6p04Zet
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX7DDlKPEvyCiL
 XbAibafCRPoPHE5e+pLLVT/UYRdu0rtS6OSpOJS6DTaN8yat62MbThlUXJv9/DPOakHOAsWIOgC
 SiHA+ydnCCeFn3fExddbFSKnx960wL8=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0485e6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXzIpiC5fXsPFM
 vDavSeItypDXQIW5YeRlv8hJe/nnafwb+GXF92waU54RU04dAqvhYk54hE/XUC/4pDXvW3knsRd
 N+jCjOYlul9HGlT5IZgkVYfrKCTu/+A4gi1Kk9Gk0kVPtaOAeW9Yj6oOyTGbLduolm2q3BNRaHs
 vOHtbNY/4XiWUlqg34QSkp1l2VSBjNwYhq5S18a4176Yy4wzIv2rbgdRh9z0HlYEw0h8bOPHzKp
 8zOG4ogNYDLWQm8WljpBBW/jn+iRZpeARnN89oDKD98j0kkTXfyQVgX1/xA80NXDuPTlYq66Nnq
 pUxcLZ0GYC7hp4g+8mGbhVQDR9UUe/IJO/kWwQInqnQHUH2fDSqh9xotvyTw/p/7EzQHpZxWpag
 WBP0oTixUYc0fzmrr1GSDgPytSuqf9+HxENPirn7kHcSVhbAJlor96u71Kl+/75T0z0j9sVI7vW
 xPyt1V1K9c18Q7xPvbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

This patch restructures the driver to implement per-path PHY management.
The driver now powers the appropriate PHY based on the selected and
enabled UTMI path, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-path systems because the
USB controller kept the PHY initialized. However, EUD is designed to
operate independently of the USB controller and therefore requires
explicit PHY control for proper operation.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud |   3 +-
 drivers/usb/misc/qcom_eud.c                | 129 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index fb927a003596..f20b82b5a38a 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -20,7 +20,8 @@ Description:
 		  primary   - Primary USB port
 		  secondary - Secondary USB port
 
-		Writing any other value returns -EINVAL.
+		Writing any other value returns -EINVAL. Writing a port
+		not supported on the current platform returns -EOPNOTSUPP.
 
 		The attribute is writable only while EUD is disabled.
 		Writing it while EUD is enabled returns -EBUSY. Reading
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 3e4647acd5aa..037b074318a5 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -40,26 +42,84 @@ static const char * const eud_port_names[] = {
 	"secondary",
 };
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -76,6 +136,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -131,6 +193,10 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port])
+		return -EOPNOTSUPP;
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled)
 		return -EBUSY;
@@ -228,8 +294,54 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct device_node *controller_node;
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
+		if (of_node_name_eq(np, "ports"))
+			path_num = 0;
+		else
+			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
+					     np->name);
+	}
+
+	if (path_num >= EUD_MAX_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
+				     path_num, EUD_MAX_PORTS - 1);
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	controller_node = of_graph_get_remote_node(np, 0, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for path %u\n", path_num);
+
+	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	of_node_put(controller_node);
+
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -258,7 +370,22 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	for_each_child_of_node_scoped(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret)
+			return ret;
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
+
 	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+	if (!chip->paths[chip->port_idx]) {
+		dev_info(chip->dev, "secondary path not available, falling back to primary\n");
+		chip->port_idx = 0;
+		writel(chip->port_idx, chip->base + EUD_REG_PORT_SEL);
+	}
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.34.1

