Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7EC4248D5
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484178; cv=none; b=opDN5FEJJ6HGzXAcX/niqKzex0jVKHzqIjvss3OMeqMlrc7Jj1DYEgQHuN5PLcpTbTiVQ+UD2VnlcPpGjUciO98a9Gj1XBhwadFsH8hJB3GTLZfyM3RjOq6jcl52OIsXU8DJ2Pw83wpkP5RnWOlMOaO3/O7RbBMoXgQFm+4E/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484178; c=relaxed/simple;
	bh=ldhObfEr4z0Xrekc9qI5UQO3v16oHY3sXmgjk69PNKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3k975WeFkfPwifO4Vvan7SuDuUdthMJ+AHnOGC8ogglrWclPqBgiyavLikBepc2QmH8Aw8kdt5EpVq6a9Cfqdbd/QrBkMG7rOHYA8auIMXhYidV1eejyI86OftCal+41zlm42DPQarPnzf6vkClB6Nu/WcLh36BjXzrWRkA5EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVP92sRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtjaIz0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVP92sRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtjaIz0L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQojv1756635
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nvOjwEmlXGk
	kLlIdjY1MOSExUXg8PKOSC1XZVD1rwvw=; b=CVP92sRVi3tpigu/yKFE30F8qq8
	BdddpRIFo0jCguAr0A4vSnXzk16v7x1JIAkc1qcQqUhgFqFPU4Tjy8/HJ2/rFTnK
	lk4IFDPA0HuYUyqMitqVWVjaYs7B2TpnVzBfebievMCGghoZJzSsX0k+eUChn8oN
	dH3der4MrcBKODQ03YB4GO2CoRoPET8YvWeLP1VvTmL8VZN6BtJB2T6sqwjaiZIe
	7r0EMuixaszIKlVvQgU6893VLnCxBhxHtqToLiynEIUHDhpd/6tHcX0C5Q8si6GK
	/5qu6cMQmxu2oa9qAGeKTMH+JcCE73U3d3lfiddN/4HTo+2FSzDZLCahE3w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gt7a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso424273a91.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 14:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484174; x=1787088974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvOjwEmlXGkkLlIdjY1MOSExUXg8PKOSC1XZVD1rwvw=;
        b=PtjaIz0L4zRuVSVuj8/9csj0HTVBnF7u7tnIEpOTDjF7iqHRkkjfy7vtR5r7/SKSlM
         j/raIivhFdqH2cAXSYRTvpQCu30z0xPJ4cO+JmDZcEI4RJFPQory8GQuNyY2gQfTxmu3
         FRgz7bxAxkfLR4Dt3+w54BErL4BvAOnOYloKu+E8XhjYc+qJRFUZYxwOEtirO9ERiwqE
         dTaVD7dxgOaKlcQJOzPT7jV/RK/ZmqmA/u6lZE9BPQH+IEJ1yLoGk7TrWXh7WV8SvYhI
         SNPHFhFVNE7Xgdr1204oq4ADASnOGBVXbzbMreI9GdPMgcmXX1itD8TwnkA2Sg8rLa26
         dIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484174; x=1787088974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvOjwEmlXGkkLlIdjY1MOSExUXg8PKOSC1XZVD1rwvw=;
        b=T7vDgHiTuWoK7uOWjAHB1tWd5dK+ubxV3DeDaxuLpK2W/fkTPlTopWzKv6wgh7+EVf
         C+bI6Mhr1hACYApy7GCuuPWrQ+TJ+mqQRWXXIjIAxFWpBdyHzJQoMa9tlTr7izhnyWZA
         jAMQyf6JLcqi8PscfmZaZqwGkW6bDiyRScUTa5schRTIAXsxfYBfv+dutCw0R4fLHkfw
         UWZl3NDPhLS8FRPvXXT7wxMoP0rgFiYN976qrciG7WLzFRXyE/iF7FlirxZ/3PpqnJNP
         d31giLHE0Ga0F03ZIr1/PUakkN9DbL1KE0bhPXG32l561swKxK0iWbL5XQIHsKsGya2s
         FNkA==
X-Forwarded-Encrypted: i=1; AHgh+Rrm2dErrcNma3pg+Rl/dwOAslrAqhC3izw15qgK1NTZSjrsRtzSAAuv0wK6bo07w6TU35hvLPU4a1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38SHeDNL6+Ioi7o77odW1ncxWA3K8BZjycAFbvhl0KgC9iXRM
	eG3w3ZY6cgdyLJCA0pfLfM+4YM0rBp5vUWoyxioL7LpXHumFtnLIEbUhqh0hQbM3etHkCAgwUjy
	fGyERquOVE0Bos7PsvwARkNOJP8uH0+svlHNMudM1FCN2QtdLouzMfDNmziF0BBs=
X-Gm-Gg: AR+sD12UNkZgoHV3WDNqzM797wBQRnsv+/tVqfPv+4esHEZcPGkKvICInEL1a1NjkoR
	LWRean9nnNJN6OL8ofoWkg7utfMker5ueFBJ2UWX2lg9lLpEUwjJhbm6nYJR8Me1ONF0Ps1RpJO
	pBIgRxK9R5Luuaq/7UCS/1PwctK/B4VnoQPjktlwc4FDyaTN6FMyx4k6TSUlmhQedJ3Irsbprlv
	6pqRg6Sq7kyTiR3SlEF/GM9XcZpTAq9r2iiEy5lzJkgEZpAMBRY9T3N2lSX+sffU66YbnyI3mzF
	OySnuywNCn86OE5THLW+3E2PvsoMS4fLVKCaiCgKjLNqDhwUHnoDe7oYa+pKFVp6kV8K9k4DZlE
	mCqof0zPYwapPldZZ+ZAYClNL6P7XNV6sWxsjrtaxsamWqE/imHXEwg==
X-Received: by 2002:a17:90b:590f:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-393012c79a5mr28716a91.12.1786484174510;
        Tue, 11 Aug 2026 14:36:14 -0700 (PDT)
X-Received: by 2002:a17:90b:590f:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-393012c79a5mr28646a91.12.1786484173949;
        Tue, 11 Aug 2026 14:36:13 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:13 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 2/9] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Tue, 11 Aug 2026 14:36:03 -0700
Message-Id: <20260811213610.2956147-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX96STLA/583T3
 ++IV4OCN+Dfyz5lBCgyYzi4W9HjYlTOyCb/HW+a5VB17d9x+7qkBfJDaF9r9vRZK9zEf1CU3KNz
 4X5X/lywtQre7jOaoS9KbEH6ruaNefw=
X-Proofpoint-ORIG-GUID: 7B-9u6l8arc6ImppJkLCw5w10zCkadPJ
X-Proofpoint-GUID: 7B-9u6l8arc6ImppJkLCw5w10zCkadPJ
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b95cf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX8WEr/0o6aBvr
 GiXb1ZHZEVyab989OwmYIg21eNlSWjER7HBi5WCIh4klqxxCqDI/FEdT5FIYegxDW2ldevHIe+/
 O//N5/jdCYczXptQJ/Bi/L+bQ+RMjuaxoO4E/CSJg9ASdZZJVVXN8GIeCtxqBasHJC+xGi78Nxr
 eEWUR1BoZgtkOmzAX+VeWDetrUoOk0DHKqi7yB7jJkSb73as0HA1bSgeskMv5W5t7Gg6KNp3KYq
 hCI/rb/gosC4/gwQj1lb4tZEf/hKrqHkwvnrAsuTX3wFU1kQlsQIRaA3XIo9O/l3AS6/9YApyKq
 1pdwpdozHM7uqNDHhQk7bEhfIFgQynf9QYTItXCzkOMIeN37zz4761xFT5ER8GAX9+fKIkWpJo5
 ykMUFOf69QHe68F1anvyqr0m8SbEBwON7k1z2TktR+NPq2tWZnCi7FpwGDfK809w+ra1qS8h7qH
 fP9oEP8CucFnF4SkK1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 39 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

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
index 926419ca560f..25a6a8f110ec 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,14 +23,22 @@
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
 
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
@@ -40,6 +48,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +113,38 @@ static ssize_t enable_store(struct device *dev,
 
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
-- 
2.34.1

