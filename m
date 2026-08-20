Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA933372B26
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237452; cv=none; b=JOfBkSSeEwWslTSmCKwmLrx8nPQHgHuEVNirHJgIOvW//YXW5v5kNZRS7OvIEs2HcjURBI6fegW28XNBtrjcFz2o80SC3HvQzuKO0IcdX5Xr0vrLjbHiUUSOAoQGVIKDjWhbOCexz8dEJaNwYBBHYPU176o/qUjbB08xrdsceuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237452; c=relaxed/simple;
	bh=S6cUTVkOjnkG5QgtrHI21qh+KP1x4A77E9/b8qhFb/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igLcQDGrClgj2z6Elevjxt8O8rBGzVIdxj3WYyDABEiXg3zk8dJOL8Ad+6S/lxDfaqXnREVTL7iItB0+w/3Sltdk2+UIarsR5LfplXwu54g8cesdUxhUI169YHb5dNuyXwZRkwL3cUdBi0Ve2uKQQI+R++GSfwqkllFNKWOYv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CA2ONE0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f391wzeC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CA2ONE0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f391wzeC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7qiw2444577
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDcccl
	sF+NZojg=; b=CA2ONE0duTxX4Q85+/itAjDjGLPQulXd6ih/a0pUMcBKFLgzas4
	flmVnvBox3zbX68G9YHQPp2gfjjQ0wQi2aqTiAYkoy045pEZ+gATA5BabxpuxXoa
	YLkDURHjWSiJ4KIeq8hNr4WCUL4RuCYhxXxHTO5NVPaXGkLHa3Syb+972OJ8I7DO
	mYHbaRbTW5pN0nuXNbdK8QdzcQEx1wYZTlQnjyv/K4RBypWuHB0EfUIyp1uLGPFU
	s5uyuC+VTEiAFtQLyKtEeNQhQE66ytP3QYkF7CVwjeDeOjhg62Gy6lWfTp/T7vXy
	uXJclWdB6lY/OLJoEWoLaS6TMUNOF5rTU8Q==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05sj8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:49 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9ee20bde0so3403462a34.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237449; x=1787842249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDccclsF+NZojg=;
        b=f391wzeCTuK8lIKqcTjHUE6pa0uKP68J/YUmmhFtyidfiezI2dHt2nQmYYK71eMgZx
         85vHSEObmR/KSJtFSkX2wPb9AmrKkzthbbzl6IDUXYP2Do491+hVaSc8SjYfPp2XZTsG
         dpDWa6OwMj/bwuiGhI3l/Wmb4cEKk4Mp2MHJ9A9Pr+9P4aCWpvhpSlkZ6vd0wKA14qGO
         w5LgI2CgPe0wR1uq9eJ0hFBraocDXEnETvx/BJe+OqGo2dFC43S0eJorPAn/3UJaz+xj
         mzFO4Of7LkwguUVhMnyAmsQCmQYVt+ny9RgpSrkqDUOybbDBJ5YiD8hzo414TpiYvkkK
         7gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237449; x=1787842249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDccclsF+NZojg=;
        b=alCfA8NC1vpeVhNsKv1QuhuPqk5l2EiwmopBT4BkCrlllYWZ6B7gywdrsZDkHlS7El
         7FqeMhcJfTxr9lXR/1XKvKxrlF/11NAl7inpDyzq70jsi3I1dExSNppv8yK825WQkUn9
         6S//bOMvt9nq7PeUJrdjocI30w6Y/a0ahzDL2dgsUyuhIa1auFM2TLVBrm8O2WFF2Z2e
         iYSywjDt1hkGXOiTjXSaNTgubTyWX+TlvmWDFUzOsXkn/W+R3ak84VQUeWdZKdlCTnmy
         Igkv7UWoltmhxARx4do6lEKY25oy6cLwY9bCY0Y+pZmZbgVVu9IR+kUA4Jmb4863RNXk
         dY1w==
X-Gm-Message-State: AOJu0YzZyU5ysBc7GU4oaQ7FYlRoiklcjuTcHPoM9ImjpXbuHFAC6dHQ
	AisjwgU3UrXi0lbAPWvRQptmdpeAXgm//iGVw3GvgHli4YSWOIQhGR8tcjKR2IJMmOfyL2BWLFZ
	ME6qBbZnb3CdjB/yqGyts6ZB6bJExoARBBewnoP8932luNgjEKbPvp2SrxhHmhzw=
X-Gm-Gg: AR+sD10IqL+O0Y/pG+xfu9u5ySz+qNPY1WDBNwI6k7dIJMR2H7enMmh3N2Qaz0IHF5d
	B7LGJjfYuYIdOZY2kG6cEJp8lb6OhztFXQ+Mf1qv7zhWlP6dNE3ljlqOh1/gzg8ALEwYASFNXve
	WdFejXderQ7tJ/xRTnOD2s+zr46RFyjoKNT4Fn4iLcIXFz0qOBlMlAg4wsbna8EMPS4qInTlWpa
	x3hVgc04VF84j/LyaRA2yc1603GkqTqRsM5M3l4kh0/JvfolWQqrkEbr5+KBD9Cc8iEXSUkhl6G
	sMRWbvfSCupYGwWKEWtgKSOAcf7eGvw0if8svKkDCD2ol+JTGDCexzGPEgM1jEHg7bIqNVKjqUn
	Dc/UE+Q0EcV1MfFlr0IL6DhcPqlaY
X-Received: by 2002:a05:6830:439e:b0:7f3:ff22:d8 with SMTP id 46e09a7af769-7f43fa82a2amr11733910a34.9.1787237448656;
        Thu, 20 Aug 2026 07:50:48 -0700 (PDT)
X-Received: by 2002:a05:6830:439e:b0:7f3:ff22:d8 with SMTP id 46e09a7af769-7f43fa82a2amr11733451a34.9.1787237444280;
        Thu, 20 Aug 2026 07:50:44 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:43 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add usb-role-switch support for USB Type-C ports on Shikra
Date: Thu, 20 Aug 2026 20:17:35 +0530
Message-ID: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gupfYVgV-tixoYOjkmCrxdCQno7X3SWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX7gD9Zuk9TD7R
 76q0y6jrpHtMi6DLAz270qDt2IYUY36XQorwIeOKfSdu3cNCv+wODSJE8EldM/6m9pEfEFmfKSN
 Zi/jOByxOAVNJI8j+4YeLOHyFxYmHqaOkqTeK3nlW+8RP9ZiyFbneb7gp3IBjHPANfLDKwsx7NK
 RKp/3xhRvC7m4VqtJwDK0xWsS16cFAK1KfBSomUftKf9ja5nCIKJ708l8wGupTY05bWghzrct8x
 P+oEKyjxbdWeoruQaHBO/dGZfkZZasCcJOFYi4YFJNvd50y+K0gEOw10Z+bBXI5DYWeYTKX6Oct
 fkwIT58KuLHYArta+tLen1kN394IzVd3+I196/SPyYhecDafFlwH5Cmzsf49p/dnOIn0sFmizWk
 wdfvv5yneq3fpMD8IoR7oYAe3GWfZuwv+a5VieQ/azPR80+T/LFEmTjfjFoK4OBO1XOY4YMi/pS
 Pgd32VVWfpowUuUweuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX4f/voM67mC/R
 QLuYkJvpu2j1/magoHsGDts0QPnLKyaQk40qA3LkRZ1Vn/vvqbRuEQ/uFZpvTEZMzNtpoJowIr9
 bC5zsksw1rJRHQlk7bPc2thqir2yFJ8=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a871449 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nkNBJ8IO_oB5ijvGOQsA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: gupfYVgV-tixoYOjkmCrxdCQno7X3SWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

The USB DT support series for Shikra ("Add DT Support for USB on
Shikra") enabled both USB controllers in device mode, since role
switching support was not yet present:

https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/

This series adds that role-switching support. On Shikra CQS/CQM
platforms, usb-role-switch is handled by PM4125 on the primary
Type-C port and Cypress PD controller CYPD6129 on the second Type-C
port. On Shikra IQS platform, usb-role-switch is handled by Cypress
PD controller CYPD6129 on both Type-C ports.

Patch 1 adds the device-tree binding for the CYPD6129/CYPD6229 dual
Type-C PD controllers. Patch 2 adds the corresponding compatible
strings to the ucsi_ccg driver's of_device_id table so it binds to
boards describing these controllers. Patch 3 wires up the CYPD6129
typec node on the affected Shikra boards and switches usb_1/usb_2 to
OTG mode so role switching can take effect.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

---
Akash Kumar (3):
  dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
  usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
  arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports

 .../bindings/usb/cypress,cypd6129.yaml        |  99 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts   |  64 ++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts   |  64 ++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   | 108 +++++++++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c             |   2 +
 5 files changed, 324 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
---
base-commit: 96c901471bf7948b9b9f70d38ea11631a8c33b4c
change-id: 20260820-shikra-usb-role-switch-a3f910b2b2b1
lore link: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/
---
2.43.0

