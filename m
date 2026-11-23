Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458535;
	b=XZ6uB0S6hQw3s546QsA9Qad20fThXTDr/NqwbjniOXD7V1MX9l6F6HyTMJtwA7Kh9WGH
	 7FBEeTeIN4XOqLMJfzdrH7L08VaavD1BcTGaNPdeIU/NFvM0ao+3vCedUdRP4pYlcTi1T
	 WUP4yRpQW5EJYjZ8AOFg1UMBb0eYU9Pr9cprA2IQ36/dxct8H8opgI5J+akW7vvMfLeXj
	 8CurZmt4DM28iaOSEP2V+pihkh+iaaMGCRwP5rP5bAo3OpymOllJglS2zyeQqcYrGu4X+
	 d6qWI/1eWR6a+M3ilBV2gfOm7VNrDzj8kx5634TeBuGeVqrIFJ2Qxo0MUQCp1UPNvNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
	b=vabxH7RlGjcEVACkNSJh0TwTIsj+75n/cukU4pMDcw2lt5fqhAN+dZ3zJM8TOMXf7nXO
	 8+ISHgYDEtRoiP/0pPuNHxystC6iPHivYiHFPrwdfIq6VEGR5Hd58FSkI3XHI0oFNBUTB
	 ul7cbtkET92jv+EWRbw628WL+7wOTCCJ/vY/0sH9I57sQWA7yaE2kzLXUTe9pDTfxZqTL
	 tY6jjtPWVawuNlAEHbCX4CevyhekxGPmMBKR7+lxlrBgit7f5NiERGDP56IX7Ww03dcuh
	 u1rD3QnZFSR7ZG5skg2zDxgZAWboNlvnbEW5OXTFzAwZjuePcerZWCEjs5snzkGlhHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6694D606A6A1
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6694D606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH5BG2844578
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lq2ckgeFeyG
	4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=; b=QgmcNHRwOTYFltbEnU8CT6eWZm4
	WXkbo1fYHF5B6WuTtNV2ePmUKqi/DuCVN3/pVec9kVHtH65Mc+wbqHnDno2lAZmz
	hoYYCMciPSTtJ2ZV44G+YejYZKwrGjjc/0rPGuDm9MlAF+Xmfe+CdG7mkSMresh+
	1YHX5ztPz6VE8AMXQU7/G7JXDePrPCDcUe+0UD4Ajd62YKiPFuswrEC53TSj1W6T
	zBSyB/dF7BO88Ucssq62fXRYMNeRNSafS/CrAFcdBtyyqu6OtoMW2Z4Ztddvd+x/
	sg8dcebxjggFGd1GnTBiDla8MUhhRinwCf4bGrNoC0EANF5WXcRmqAmnIkA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2v0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so9766171eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458532; x=1796063332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=PVfKytR7uyik7EOhP3PMKvv2wSoWbchKb7P5srh9XzqXBy+D4JROiV7AP/Eaf6zJXk
         d+ac3+FpunoRRZ+FYoRUEvDqQTTbe+/4NeWVNbMNpSGUq+xTtQvLBhmd4b4iT/ssPRHa
         LUeGqC0NKd7OmsbhunKBDGznH3+3Jzi8pAy9lkyDC/qyf93ZcRAq80q28fvlHNIwf22L
         C0qTc6RkUVoWuHIal+Inm+yS4CaElGhhnFSDrjX4VCPvFduVdfk5qk43kb9Ytr0FkVik
         QbkJVcjLJJ7d/LQUnqNGzPvejSF4txn6besl++DXs+Is6yz7OgzjSAiGWLBINy9RYJQg
         1TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458532; x=1796063332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=GEmcWHvicLYJPeSEs2DKaos2bSyDuRvgfptQESgv6/8IWCtSVXwwGQFQx6MROP44vE
         KqWa8WEEHParreVep6FixKRWv/Tr+pBFQ0gizNQHnzDiZpCi5LtuKqfcUs934dc5garl
         S6DepN21YnlMS326/H/+pLT2og69ccr3HOxIKdmLS7EI933gaTK4BnH/T2xNVcTJoA1o
         QubxU9eW0AZogwDMcvr6o4NWYIL1sZLzWfVQPilV90NVh34KrFsactIHhhwmXSz4ERkB
         keQ/Rw9q+0ZgJRA0+ICAnIF6IY89Voxg8XAFqez/rg/L8Gf8APzHWaIK9iWyNnbm16U4
         14PA==
X-Forwarded-Encrypted: i=1; AL+hErFJw+LmEDZh+1crPgQSO7vxPr9qI/y4cIwBdhakAqX9VGLIb6KBV25we4vBgbhzHGYMUv6pZSPZPQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QQ8R2MGrNFK1kRkm9B4B000TYIvJH5SOhuScRPdKzukUtHAEm
	S7boUfDt49e/lrD0nw/CqeY/jJHM5UGYdbHt3q4+hHoYG8u7xPO/HEAX9eWig/dWTLSqPsr1944
	8WEfGWxcKqglaVYroeLwfFfcvDqbLFwzsyyTXKQj5XnWmzWpKgx+FYpVhYc+d6CA=
X-Gm-Gg: AZFdTZd5X4pQcxjFyUhSYhQhbEtHVcB6N3ggBvw38Hee403H1nl6CVNikk3ZWgLUXfY
	pZm5/o64zHh9u2Im5bby/L5Cea+5LobxUszLFlvZDojXeOXParxt6bOg6JDBdb7Ai3yx4wKqh9S
	nzdU6ffrk0t8nUw0mVkEY1jzigg10a/1eD1P63/Vyl2cG5pF5o6kCTUqaj4YPyAILQLvBLQCJaW
	KebxRnYWOLgEE/D5JnYWWosY+s7V6y/4ad261zhN+YIEwzZu9tG/ZoLQxjrT5AyqPg94srO5vJa
	7Us6swoJIzNUyxLe+cy3dZvjhDjRnD0Gug4Gbgv9GhGUXnM6TT/qy4fDVyUzmWJDtdaJ+g7gHCA
	4y9p06vaIJAl+MNRuZ6vPVy8OoqKYjrMYkCLoMagImXgsF4XHw9hJtSD/z6tdVp4u3WaAfgP+wO
	+wmS1bVtSbgiAGUqXm1kOXbO8kNw==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643547eec.23.1795458532050;
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643507eec.23.1795458531488;
        Mon, 23 Nov 2026 10:28:51 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
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
Subject: [PATCH v10 2/7] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Mon, 23 Nov 2026 10:28:42 -0800
Message-Id: <20261123182847.143892-3-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXyTMUoRCcfJ8o
 HU9SMK8dy4Bqk4FVgMfW/n+05PJj2IAWhutoZwgtIivOZPoZQg5dHASLPdAcznHoSf/Wrgc43TC
 HrUcxscXuy9ZcuACwNX9MjXzqFs4KkM=
X-Proofpoint-GUID: zm1d4GSu93dKS1P-UCpiBrAbJ7CptG-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXyuXzatMFb36U
 bRA/huioG3iOq3SH5/1lxKWCpH4lLszjVVTquiW2Auj0yuGfSCes1yDmGncub9iLf+IskYEddJu
 HsroqKP/DoCkywQhozTW6yF8zo8uSUPmEcv2fPjfba/cgZdJw5UmxI+E9r8hsrzq8UgxiCuU4mm
 PKnVBLAIpF5Fim3XD8v6d62EEl4t2SjlpvX+I3PnbE0ZCt9jJ/Uep8dXb81pQ2V6VWuNjgOIdHr
 W/laVLbxw+6OyghwTqgC54cRshvp38vbHi9JgvHJ7DUCEWGUhiTMXQXP1645H+8eaEjz1pJxONS
 1Oab2m5DYciHSjffMh+r22H99VthCs22dU6zpkLJUry3yMBzuHEiZNFNWpxRnOdN5ULUnBZz3dB
 PmuT6Jmu9EUyHfqcXBISNYNeLlCYASUoJ2w44Fpz13DwuIbr7VvjjwDnpnyCyC1zuCfVxoBH7lI
 Lh5X0x+/CeOOEmgZicw==
X-Proofpoint-ORIG-GUID: zm1d4GSu93dKS1P-UCpiBrAbJ7CptG-e
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0485e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 42 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..fb927a003596 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,21 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  primary   - Primary USB port
+		  secondary - Secondary USB port
+
+		Writing any other value returns -EINVAL.
+
+		The attribute is writable only while EUD is disabled.
+		Writing it while EUD is enabled returns -EBUSY. Reading
+		the attribute returns the currently selected USB port.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..3e4647acd5aa 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,13 +23,22 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
+#define EUD_PORT_SEL_MASK	BIT(0)
+
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
 
 struct eud_chip {
 	struct device			*dev;
@@ -40,6 +49,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +114,38 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);
+}
+
+static ssize_t port_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	int port;
+
+	port = sysfs_match_string(eud_port_names, buf);
+	if (port < 0)
+		return port;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled)
+		return -EBUSY;
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
@@ -218,6 +258,8 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.34.1

