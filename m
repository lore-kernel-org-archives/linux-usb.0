Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550512;
	b=0Gp/cAaxiLhUFAh90JySIe9b/9LDxlKLVpTQltYabjglnLgg7ak5uDbQ93yy1yM6gdZ7
	 jjdsFEHLxjiHxccYo81V1nLWLK68xU0tuB9fxEHl/8lMYYlFX/cJcdnVQB092xoIBd3Ue
	 BAyydqsli0BdYNN19xGfpoKWRlxF7VITL52HETrIquNk6P79wftqHoG5OFM+ibnsfFbJJ
	 FHSH0bOqbpSUImvkVFHtjTFCMKYz/35AyUjEiyl6mjAsptJ5wsR4BeUZtRfMH3c0jK0ps
	 edqzbs4ArqhwzDhkFajdl+H7qcvlQB/uR0HAfeSfVMAg5lp6ZwXVyppLj7tvgfvhUFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=;
	b=yfq/F7z48YjtE/OrHmxRg88BxyUpNuhfQN02zOCP/jc7XXnhDV0cHKD2vTfLXcBaZ7yW
	 OB6F8I3DxzpfjdOL+Ha4xj6JiV9ijJV5iBdJ0LT7diuqTakHTWhgx2jXVU5L1w2OCkVbR
	 bh6NrmwAXpd6WdEksV5GcxnJTB/rc5/c9HvhDkK8xYcWQ9hV854gAUmDMHah+ZLoGrmhq
	 0aElGMvameVbFWnwCcRP/tEtkAURVCWQoQI4gCyfBgjahruh7gI6G98lEF3TWF3hDO5wz
	 eb3xTSQoA+KXtC5mzmjRxlS1w1XfqFz57zXtxqXkXXrg6tVft4/ayPZbNnPnyXMIYMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IL57Sml5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYTPDVn2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA3C606A688
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA3C606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IL57Sml5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYTPDVn2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJOcvm1758326
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=; b=IL57Sml5xfe62MdB
	iyqsS+cXKZEmhzpSy1p8TXZvotmSq94ioD3piMTLwelIU20Cd6xM76gTNH5LjpQ7
	Od5t1wWIZy62T5XVzXGZTsOPvw6d9CTSC3ghD2yONumAcl8JItAkUzUqc4//qvV2
	mCdcyvxugqMclUgUagSl8jgn7oqfowJatbYn3pQ8r/eQefe1KuAoEwumyjjJ0IWD
	k01FDJzwsNJ2LincnZ43ewVzm8Q9FFouz3sdW5HIpntJ+TtOf4VbZ1+s9heORZ9X
	Vsgzl3vAvy5NbGy8UOt3p2likBgzbYd/OO3wAZ/MbJSz6qkSeoeZxBL+dK7fDgsL
	quY7Dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpks32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9460411fce4so27471585a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550510; x=1796155310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=;
        b=BYTPDVn2Gkhxl8e+rU5qshmiEnl29Lap7ArLPZ67M0cwauIqMe8NK3b6PSwOFgtB33
         7IJ+O8aYmTZsKj6uqRgpRXKzq38pdG0wmwVQGKlgUOb6hxHuB5Lu1hxfiRclDYry2av/
         bOF3Kzlbo25uNaESxFc0m3Zl2T7J3r2lr0lrWmhLBNbbopNDcAY0Js6Opq95sdyN9Mu3
         tbrJsMO6av+FJzdnVQTxebJf5wVdoMrMNW7GTem6BAt99Up9P0i/BDZ1eleJpEHI9zy9
         mPIpeZnk3Mc9juCt7RCWhP+hr9gEtdzRx15kh8pEoXV87BZcH61hi7kIvrrrp407SK1R
         qC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550510; x=1796155310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=;
        b=NMVHM7GKIOKeW/zaWMeDOZIzZdp0QeFb9jCvFBKr6r9eFsoGESyVYyo1Td2dmCu5ao
         LNm/XtRIVXZ4fA2BpdUSPavTnR4cR9dde1U7vdddj6hN+Xco+tmX98EOIgyKRzUFGAZ6
         NqlxQE4JnJECsLcRpAEWzFKvlf3HGc0sIRGufL8/tiSdvotx+w75Ekymjv5Z3yeIB6bF
         ufNGuFnsyXRK41P3m1/ulrez/uz0GuGe/S9AqG4VPqKXnuzgmDOLtnYQPGnXj4wVPRwR
         bjLIA+2zyfvH+GwlIpsMekHJiq19ljoZsW3poyo6OFnyBaAc9sfO8UE5YFapTh/XDUUw
         PK/Q==
X-Forwarded-Encrypted: i=1; AL+hErHWC5R3ttEymEA7OaRGs2l/gwFts7iuPBn1nCyRiafP/s18zqyLUm6sEdKZ1tydPv1kL9xidK4g4VE=@vger.kernel.org
X-Gm-Message-State: APuU4Z++4MyrUhJZzqpOZcAPxm+rsAXNQT6HZiKcMgcVrWxewOz0sLcf
	QI3wFWGOSasxFEwgoB5Xle9WlubVjbc/GNeNXABlW+2J0ev8AeQeZP1mQokorbdVWSddv6HHYAG
	O1DS+W7UT5Z+j9A0VIQQyJrs6dsdJ00vLnuKRych6FEzDooYisbRXJ7/A5ydFv0M=
X-Gm-Gg: AZFdTZdR0gI5mWHrRCC6suU7cIQKOlXBwu4b3deZRPZw9Q6Y9W+/jVo8Vq9H5u/JcPS
	0A9tBSRaFbD0nh8OctLH5UNiAyxgfkmQzjnZo/RVss3hg4Q2WyRfeLys+K+d0qZDcj/LufwbyJ4
	Kdxu0WEBYZnk4HRXTYupHRMfv98A7hfiW6IN8Opcay9epd4oltdz4Oj7ZKT0DCEP2zpKWbPPZHb
	e4Fk6CTBok1Kvih5NvlWjqRI47Ce6MtZ+9wwm2LXvRXpR63HRbFsYRgotpJF3ywq2jM8pXIwXZk
	LlXcTyF1Ouk1oLMw1a8BONHNdBmvLP4cvgbUkwaeGplUUcn2kdgStjuPl8dYY+9xT6D54zRQiX9
	s9Ti0f4gWxZ7AREvghH99cP5MdA2ZbrkBx8i06vVK01DrdjSfpdKxvirofl5O5Bt2oUdxkl/pNZ
	yj5TItHgQ=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2610569185a.1.1795550510172;
        Tue, 24 Nov 2026 12:01:50 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2610561785a.1.1795550509471;
        Tue, 24 Nov 2026 12:01:49 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:32 +0100
Subject: [PATCH RFC DNM 03/15] soc: qcom: smem: Add and export
 qcom_smem_get_serial_no()
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-3-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1977;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=nyFC46n7zm8p8bagrW2oxfhZgXokuRotVUD9oCP1whM=;
 b=w0CIr1nIKA69Yyrqw7p+nQ1Z8hEzyr/LwyMikdNGHTefPdGSDJ2hQo3CF4MueqFXzzJ6CvlWB
 OpwZTb7VxfZBznAuMXmSLI7eSQC0LI5m1Fr2DoL7AfQWUUmvUJqXYKd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3lUwhb93kjLL
 7M6w6EP+9bbR+EJdGrnjoTspchbiO5icvKegmt5sKNByt3Efb6Ry50HTza5mDuQdPipwbsJUGyM
 9YfOJv49QPFlB29Y2G3lU99cZTZeDeJpXhG99YBMGr1zER027sZ0IoWX1UaGffHnVeSskZzKCHF
 OK8mjn8Ea07boqWYGEYHKtJI5pR3RkMH3eVsR2FS5nJw6Elo6eqSPNPZU76Brg8uUkcfk+4NMWT
 T7AK5VabymMC0zdzDyhstLjyC13wVypcmuV8+5FOeSFicVug1VZfOvzQQOz1ShnDlYF153hdwl2
 wWTvcXyfKUp0kMj40Em7G+cgsKwyxRl4w2z+9AFt5KnH/AlbEmrM/Hgl+nY0N87djtVQPS/qGKB
 1cWX3xbBwd10NnSUcWf41RdNokyDlUdWVvynxxYBT7KasEH69+WvAN03S3Be3uolp8R6ji2AsLj
 R2mfCh7Wk8iMSOG8m0w==
X-Proofpoint-GUID: fRNqaLUIYyv7UtV1uQKGsHqJ1NuxfUF4
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05ed2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qAh8wiVjB6r_GXoMeusA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX5kQu08U02el8
 dJHEtLVXQjA4/yOKQ3CtZln/xuMnFwW7an6kMeQN8zYlB7XtE/cVWpGT8XivnwcAm43cR2Cbko7
 6Dnat5oqLw90lNqE0BrlZdnl7VqE/4A=
X-Proofpoint-ORIG-GUID: fRNqaLUIYyv7UtV1uQKGsHqJ1NuxfUF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The USB4 router expects that the OS programs a silicon-unique value as
part of its initialization flow. The most obvious choice for that is
the part's serial number.

Export a function to get the SN retrieved from SMEM.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c       | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 78b9d8b9229b94524b596c79cd0dbc26f05a8dee..45b39dd34a115fa2654603cc1b547d883e89a1fa 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -912,6 +912,28 @@ int qcom_smem_get_feature_code(u32 *code)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
 
+/**
+ * qcom_smem_get_serial_no() - return the unique serial number of the SoC
+ * @id: Pointer to where to store the serial number upon success.
+ *
+ * Look up serial number from HW/SW build ID and return it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_smem_get_serial_no(u32 *id)
+{
+	struct socinfo *info;
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	*id = __le32_to_cpu(info->serial_num);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_serial_no);
+
 static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
 {
 	struct smem_header *header;
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index 3249cbd2016b50950842e357ae4d591dc2a1ec55..294b49a629b9a739a457773b041775716ece238d 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -14,6 +14,7 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
 int qcom_smem_get_feature_code(u32 *code);
+int qcom_smem_get_serial_no(u32 *id);
 
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
 

-- 
2.55.0

