Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756995;
	b=mFanMXkxnc9Xw6M5Z52lPoy0cQFZ/275EoiFcY7pvwghV9wA9TsPQeHfPEmJlYu7tVaj
	 kW4iO74TugffYM0clcurKCb7PNieLeHgihc3MALJjyIDgSnP9QO67fb5tsAi06v2GsUBh
	 DGM7gIblpXcecCUtJ/ifmkQarR23mHOumrRqmHZ9YZqZTPqO6ay693WTjv1p5X2lNWOXJ
	 mcUgFSPGpCswmlZ6SDRTji//WpsPSLm5lqAp8Ga/stggFjqNGPl+1vsrqvs9x7crSVA+H
	 9AM2R8a3yXaAgQqmDBr4AFXNXsKr3NYTuWOfUCkLdtzYWKvMF2j4796CJADFqotajgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
	b=MLH9nzteWtA+XGWuXNmeA7ZvwR7aWpO5ObKWiftcNAXi4ETI8UN5nwckG4hBozrRaG2h
	 ZJqmehmp8vMcrvJtFNMTBrvutqYX4hD+EXqJp4YbBQRb0bjRBjwp/fg5pH9x2TQQPrQel
	 thRwSqZTzTqbKuFmtV4NvwEPoDy229kowhn6/xFe9kHOBmiEuM04C/jF6GdIhUVl649hH
	 r9b2zpdDt/CwaXTrR9QNUCdZMN5fNHgR2q0oPPLgVmfQsxq25w0m8Wh+eFWKUOFf+zhaU
	 pTjyotUmavZTthMR8j/ZQN+xAQcMT5ygBoCMsjKg2vgRrHJYZ158seqhClyZjwEuysA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6tDHM61;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST9TcywH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F70606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6tDHM61;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST9TcywH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwXot1011483
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EAGgXcLUFrPzdFT+vediXn
	Dt2ttji9J/V8iM8d9PPz4=; b=a6tDHM61NCKQGAXOTdDYFT2eUPx5PGXZyI9jD0
	ebSSE2QcdZtlPqpwMmQf+YmhbGoBQOz2EsJ22rxItFrmBJ65m+2SXGWzbJQR/Faj
	FnaBXRMJvxoTN3TBushNePmvjhy2WkZOKsxm9+suIXTO5C3bLNmCNitn3muLYVMB
	aIhHoQOVuHZsk+0MtDYRZ1aJssUdeMWN8/5m+numPLKIZOryK7IzTAlPKtFjqjBY
	ZyegnpJxBnkuTdO2D4rNmrBr9HEHixTzYw3S29XJlxvPepFedyRko8IV/0vU2u25
	q93dhMU9LJ07QvC2PA4po/aZhbS7mMvg28ANWTRUjfNquWag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf91vh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08727641aso1583673a91.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 21:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795756994; x=1796361794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
        b=ST9TcywHKDeq+1Ktb2eA+v/m/SsDB24sdO3STtERpqPeXfiTdGtSrVp+CJNUh+b+ls
         XoJ6gePheBFJ7BDKPk1rQNYyQZIpnGtySNrDn7qKbzkSXBe9aOdVj+XJ1mx6EAmMP4cg
         zUxeKga2cZR2NMVcZ3IL2eyakLWREz3iLVJ6Pj5Bv+jhomH4FIUcbVkqvJgmj/aCYFit
         5SLGCPtyNIYfkGvSpXnXaoaldFa8jzbCgyBwscfe65kN7DERAOJn5rqrshxtuZiotanO
         XlRDB2vODBcEmUQ+UNsiJU7K8fN/8P5kio6h36TyVXM1Cqq2DZRCvu/AU5u+Ke56SV2Y
         swIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756994; x=1796361794;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
        b=Hhs597MfRvYooe3JTr8hVJ8FAxUA7kg68XYcJcE1pptPWNN/9d0fMG2BAxHiJ61XYE
         WdgiLUo3NtsLI4Bk0mRgzE7OaiuMd5dh2MkX63+SW+kEnOV/hb4WcxGU3NFmjRGe5JWu
         S38zDFpEtjqh+NqZ8F/DzxrtUvqc1y7oLcxqrXaOhHECi1ebzIVqQulTrleyhxzmMVL2
         0namWfVWGfR8e5gubl6/2ealw6tjS1xtQqSpTAdvjL3+KcWnZ0vPzlRuZAD9o/VB4XF6
         vHApnBa8xOzohthKJ3Y9yWI2cc1tzNE0fh09VJD8qtI5eXTOXJEDYuDfJ5gLlItRRwr8
         XQKA==
X-Forwarded-Encrypted: i=1; AL+hErHCS+CrvPoCA4iiVie6jONaKo/a5fU2R3QUT9xmswRQb+vlozFhugkOschTcrKjO7gF3VTuzdluJFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VSZc7lGxYJI86liGp74OMqjeNtGlrTuyKFlrpLkui3LpxkPxo
	E0Z6ZvmJv+Yriw21jiR/MEh35YZdfXqy4+JvWX5tfilxY3MLyVFVE5kw3YKbBXKM4tTHeXyZDyL
	Uz8IyPHVAhGG9n3IlIpLQeyvW3dy0I8s9FEnI9Juc2eq8JPKL1YD7GKauxGVfp38=
X-Gm-Gg: AZFdTZdvcypYRPXTxVstoadZgg20nKRDZzBz1Pcq3CCubjiblumuXc1kQA6SVIMJyAc
	PltAxQrjuoQOeArznYdrdJplWf/693EtW917BNQ/CD51B38YtdnqarOWpuK/d9ZirR4Bt6TN6LX
	5077KaCdjDeROBH6ymzrSOEqVPsR4nZ5ZXGYLyBpIb/hjUBbdq0SqMU9LxY3OO5ccp3euaPloz6
	Il4c+JQlYjm5CRK1StXN227G2CnxvOd/3PRt6Qpgh9w4qpGJ78VRq4pLba3c7MskhqRTk6IKOZX
	MY3HAFwv6QSDJ7/8U40l47uLxaefqAW3JABRXFBf3byIdVZNntY/hCBYImmHZES3Fwe4jMdqyVV
	os5L0fbXGeMaI0WRzbFwxAEeRiQss1pxERfubcR2glxiFXItDn2arUQISooma2oj9jzMKcLLBUl
	5A8xMsmjhcVkBSUzDXnPqn/SBdd3oCo/TyM/MGF1wX+1jIKkR4kMfhiFFv3Qo3e0LQMAjGBNbpM
	wQ/DqVCYODWXB3bItBacC4Z0xB0
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr36632099a91.2.1795756993748;
        Thu, 26 Nov 2026 21:23:13 -0800 (PST)
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr36632065a91.2.1795756993296;
        Thu, 26 Nov 2026 21:23:13 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:12 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable DisplayPort over USB Type-C on Qualcomm
 Eliza EVK
Date: Fri, 27 Nov 2026 10:52:59 +0530
Message-Id: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALMTCWsC/32NUQ6CMBBEr0L6bQnd2IJ+eQ9DSEMX2QgUu9qIh
 LtbOYA/k7xJ5s0qGAMhi3O2ioCRmPyUAA6ZaHs73VCSSyygAKMUaIkDfWyD8d444nmwi1RQadu
 5wsARRdrNATt6785rnbgnfvqw7BdR/dp/tqikkmVltXHdqbRgLp45f7zs0PpxzFOIetu2L9rl4
 Ru5AAAA
X-Change-ID: 20261125-eliza_evk_display-1285afd0624e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=1478;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=jOB9ZaPxV2ojh2yhuVh2IcgiDE59d5e+lxYsxG09L/E=;
 b=4LOLxl0vTdCdDcjNUzPZ6hF225Qv6qmwXN8izFm7tMvFRvnudXnNo08C/zXwOU0CSxF3jgnTT
 zv3djEtBoxVDK7PuhMGdIswqO8Np9FiqrzwGdgWrPAOpP49UbbkJr+k
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: RHqFcna7hQD67att5rBu4AhzicH1OGbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX4mAHLaP27/68
 4OR+Mwr8Wy96P+ODNIjMUeMl1hOu212TIaWtGczRhKT2MubmYxFppKgPtF/7a2O+Se8cKnp2c3H
 0azz6DQcyt8fCyC7lj3S7vzahaZtWp0I8kDJZ2jkYljFmtVlI20YQub6vJPn23+A0hTCw2bzc+O
 5LwfDUoXM8ovFqDB8j0x+vFuHKoz0VDonGTCHAJ5kyrckQbnTZU7xxQAQ4D44aCZZesxl9480Gn
 5dfH1XXBLunUFnkYPsX+qjzlaOVyMltI8Sk6FxSZq0MsMRudVOgZIbEhSS4IKTmt1tg3fII71xy
 CmBGtrepa8oRJ8nVJ9lOKk+YqyxFZtxS7XQnpBpIvVlDGmX/FzijS3eIpIyoh8VONbzmbAxnYBe
 InqpWw/MQemFFniEY0YM9FJYHRlnQTcC9MkoIDiOc7SdHWXhxKMEkGk51GzvUyKWMaOVrDZKGgs
 6c4zTWismWj08jr6wUg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0913c2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gqg12Ns95l8UnY95JVAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX4EJiYQWjXjqt
 FN7NkQJaR3IB1QMeUrpThNhE3lTM/OJOks5rLgOyFm0Ep2Q5HK7sneRBeGg0v02H95m7jDjVIvl
 xoSmJ0mjh1jl3qEh1C3aPZHQDIirJU8=
X-Proofpoint-GUID: RHqFcna7hQD67att5rBu4AhzicH1OGbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270021

Qualcomm Eliza EVK routes DisplayPort 0 to its USB Type-C connector
through pmic_glink. The board also uses an onsemi FSUSB43L10X
GPIO-controlled SBU mux to route the DP AUX pair according to the cable
orientation.

Add optional vcc regulator handling to the gpio-sbu-mux driver so boards
that provide a vcc-supply can power the SBU mux during probe, while
keeping existing boards without such a supply working as before. Then
enable MDSS and DP0 on Qualcomm Eliza EVK and describe the SBU mux path
needed for DisplayPort alt mode.

Tested with a DisplayPort sink on the Type-C port in both cable
orientations.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Add gpio-sbu-mux support for an optional vcc regulator.
- making it 2 patch series for driver vcc support and Eliza EVK DT enablement for DP over Type-C.
- Link to v1: https://lore.kernel.org/r/20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com

---
Vishnu Saini (2):
      arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB Type-C
      usb: typec: mux: gpio-sbu: Enable optional vcc supply

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 49 +++++++++++++++++++++++++++++++++
 drivers/usb/typec/mux/gpio-sbu-mux.c    |  6 ++++
 2 files changed, 55 insertions(+)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-eliza_evk_display-1285afd0624e

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

