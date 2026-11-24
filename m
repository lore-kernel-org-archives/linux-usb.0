Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550515;
	b=XB6rbTKxtoHzjRem/YA5nsEu2jlpq3g/PsTSC7+gWWmKlXnZcFD0vYP0T0hnixl5eMpA
	 WCwVgq208E8unQ3aZMiG1FFUYfUvJoep+CGsodQfP9uXFzZOC8qz5mkYxYjsi3aa+icrd
	 dZ+2s9eee4saYBbvmJ9XCoctWzTGHdya0pMG1czFuvz0uHd8EdZz7Wqvv5xEMjFcwlayJ
	 p0CmIrRZbW7is9u8QXEeDehik1T7kHDUVvEzMbyhhPG3vVCzBiHlHBWd7J5MpuC2FwCXc
	 RCoe3UqbCyFw6tUyXeuUxWfDFQv625jqL0p9b0izNJApQCWVjeA1Ky0df4y+3qJrtqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
	b=q1fBG+yZT7w6RxbahQCHRQqrku5dS3WvP4mdSkab9xIi5YebvOUR2WHHBZ45o6wI2ztU
	 ILB7SVrRGQs8+KA3sqsxvkQUh+bQWoXnPOYuKzBh+1NVZTyV4BWVZX7mbaRW5dzPBZBTu
	 jWej0iHUeLKWEo3MrjSI0k9Hu3BDPvkgZN/DCTNI/6NM3kvAo2xFVt/EBVZLdxa6TDymM
	 z3QaXaynJJlmSG38nCB4w7bDwg1mrHlTH2vlUcojsEbvpkOQW7zCBFItoCgtuI8F66++T
	 d9p+p6o1I0CjR6TUKrV7K4vB+BoYQEKaAzJ9TnoxISdoKCFaxC2x1D9EBd4Ubjvq1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mbn/v1qr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuvqWbU8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920ED606A68B
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920ED606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mbn/v1qr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuvqWbU8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJKYWu2855028
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=; b=Mbn/v1qrEphKP6KH
	QaIjKnLmuVnDvXfbLR6ZtxJdtug750+GoiZnmF40mZeOHvKWoDt63ndD2ZwZXIzj
	gaKsI5mTH8d0CDotUO8cNR8JiCinSUgae2+s1PRRuqCvMvGyCS3laYuVjP8FrNPo
	/Ss9riJxY6fEqH8UMf3VcGJOeR75lD5JNoXVub45yZI/n3fBJLYsC+Tftu7eBkef
	nTjgiOrHVucjsX6amchlYUEyoV5XKJo/z6UFRH+qmkoDT2JzTv1Ydv7fAgZzU4Nv
	oMC0v1eG75HZ4SQB7Pi5Jik24I1IgjuaCpSevqNtqtFzXQZBgro5+VYp0X7YPV9X
	hkivAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf8570-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496156f74fso58354085a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550513; x=1796155313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=OuvqWbU8JJYCbjLLyksHQInVkYq5GiNguQxohBWYa2miYRiGX+otHvzcOjSq+rF0K7
         brC5g/b0+d/0Vt440D179Tx/5g35ry7rPtcwOJhnjkjzirm/8+aGS5Ow3mesoY08bae0
         xN9nBCrGHmlzmnmoJ2Q7m7c6YqTo4Co+Yli9qikXq9GBT90SdlasZF+SMfn6ju3QdVSr
         M+C8TzQO5nyi6wBu0QCDJsgwUFKbqGwjsinISXhLDKuGpW3MGxJQWMjcqZg87k6Wsks2
         9kGo98s266gmdid5TL4sv6NIag1t0aI43qmJdOuOcjw2uGk5/7N5fPnpbjBC8oAuoBy9
         9b9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550513; x=1796155313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=nW/sKG0WUda5wMzeQdkWTA/+xm8PH3ExjKMys2Dec4bq4cLI8XJPObA28gKNshEnIF
         1Jf4Xne/rGg+1KvmVirmdTUitjOwx0PpHFTN5qHZrDSTifx+QWbHhFGfPNhKT89GyKQo
         E2A7pEpU4SeQrNGnev6SEXQ/Jsy6d/zpTLnFHAVgBh2csPvv4R5EtSL2NjcwiyUzFMLc
         7dodnBidEvDAwVUcxrIxgCw+QgZh6ytmfZym1ZyI73C7ECA8+OycpA6XUGvkmcmNCdXr
         ssRZO+5ycCSWWjncfD4PO3MVX4dJL392j4hujtJTj3fvzyjhJpqxmenIfTGBzocyaIZa
         5IBw==
X-Forwarded-Encrypted: i=1; AL+hErHO74X5a1c0DtRrEWuPEtgPD7wS9CkMy8peaOMADx0RK7fGe19TqXZdYURkeSTpVMJuxTrFdeX2qUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lM2a8QTlSN9s/5L8oX6+uGFqx0/rMBKjYTn9Kz2NTwmxYiNsL
	fIfjESAoG+gBqv0F6If78ljHKdxMbHuOA4i6LGvC6CuqFLjN4hWWbRm4X7iXM6M8XABIszfHjkC
	gjCN3TYKJCFx7rFRbRbomBYnrBcdcamLhCVrNlSHP1CYHjfExOVoTAx0q5Wi2LJM=
X-Gm-Gg: AZFdTZcrIdbSR9L5cIzhUZJ0FECVb1p3lLhmP1U48TMMMi81I2W9iMQ11xjKNAYDwW/
	XoegVc7OWdWL9hUzzcelgkmCWia9H8Yi0vPkV+LVap7JeyaphNNelVtVitBcIW+av75ZJ+XcBXL
	9YaaBR9kFxjVlTkKgLJMBks8wSImDCcKn/Sg/WHnYEDt95LBLpsfLsUqJ1d1KjhufHHglpJGzv5
	KCu8yIRVQ31Pl0iwVIt47BJvyN1mGAl8MLO8obt5lhZGJdZvK7vcB9Sf3Z4nHRgH7tSEcOaNxbj
	dJX50VCqvB0CTLea2jf85yXV2KZG0YguvCoqkhvXXdUnLr+exZCJ3Q4r8mAN8JpD+66DmbhxvQf
	Upd9Xa/e8V6hPGIygTNTySfw8CJMS+p/OM+CPJRLYhJIniIg1bphR8x47q8cXpQ6QmiO+HMIdoq
	YFoMiM+x4=
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707796385a.6.1795550512826;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707788985a.6.1795550512169;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:33 +0100
Subject: [PATCH RFC DNM 04/15] soc: qcom: pmic_glink_altmode: Enable
 TBT/USB4 negotiation
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-4-a9b45c69cd38@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1317;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=3/ET7POdT5Pe+t+Zq/yBmXJJgRV/1106W5V/3UIdJRI=;
 b=qv7cILk12lrlqRgI8UZiPG9d9Yieiz5lkd7kkOPhcEJOFVffw1JubNmMvhJFTs5tWJE7etKhH
 eT4plqUe5EJAL6sEKHgE1mFJ/adw3SwYZXmYsinV7VV9tLoCicCt3Zw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXyCjymyiggA3W
 1Rx+aulfeCrFPmyJ7poVv94wuatntyl8upfR+JQMgh3lypmLc15D8m5+qSKn44lHUJb8secuL0f
 i0qyu+vP+Pg0SIMnZFYXhLdQNlGYAhs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX1v5d1nkvOYaF
 z4InuAxcPL9wLK5B+TGOSApQokHCmWjcdAwUPQsyfCHqp9VQTHH4rdHllD7JTJIjx92yEPTDxOp
 LUrsSEnOw8gl4/bZ5HGJEynQK881DfBXlAVuI38UUrStfZhqg4f0mfDx+Abrd0WBq7zccCLwIiu
 1MDS0xrXxw+DX4VtLjnSe3D9iDT92yN7kNulWcwBK0Xpr6zmCT9PhMNNpF1TbyE+tMCsmyKb161
 /FWrLvQK/5YwsHBM8AJ8pvoeabPeyYZKv9AP/lAtQw76KeORjqllp1N+fuYTyjZwiNYqjX7ZuJl
 O3tWnLWox0oNjr0A+66ZW8tz3J2vIQEZV62avakpqt4nKiWpqRLmHZiBEu3gzp+wvN6+Fh3drpd
 7Y2AHxL45rw32E3jLop0+SEv4zBsRBj3wgtM0/2v/0MfefsUR8YJH9fih+BqJvEi5VQUXkvjlfO
 qJkuX9FlLY0ip9TyL0Q==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b05ed31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WbklaN51CGUtf8hYuKEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0XJ-NHUke3Bh6_MrjiAw6Yq6fKp5YLxV
X-Proofpoint-ORIG-GUID: 0XJ-NHUke3Bh6_MrjiAw6Yq6fKp5YLxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Now that USB4 is supported, stop identifying as an installer image and
report the default OS type instead. Newer versions of the Glymur SoCCP
firmware require this argument before they enable USB4 tunneling.

[missing W's s-o-b]
[konrad: commit message]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index a8097c54a65559b48f64bfb65a1a4d0d8e033be8..f54d02994eaa96af04c673459b28edd482de37db 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -571,10 +571,9 @@ static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
 	int ret;
 
-	/* Set OS to installer for now to restrict USB4/TBT negotiation */
 	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN,
-					 FIELD_PREP(PAN_EN_VERSION, 1) |
-					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_INSTALLER));
+					 FIELD_PREP(PAN_EN_VERSION, 0) |
+					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_DEFAULT));
 	if (ret)
 		dev_err(altmode->dev, "failed to request altmode notifications: %d\n", ret);
 }

-- 
2.55.0

