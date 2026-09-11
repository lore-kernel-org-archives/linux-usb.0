Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F74334C9
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112073; cv=none; b=j/0ZdQ/Kzau1WIJcCa6+vYlSuZa5RShfcyjn6zADZfsRL9Rn9Z+QogfXHec70YwB0sixVQp6JDEg3N5hEHFhKiSm4ic3YorZqHU6xpGWxtTIv6kKSQAT+wkTl1JDjwFW0P3t1Ft5nQ1rFKjY04a3pU8FgC3axDS82YAYj4WUufM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112073; c=relaxed/simple;
	bh=/XV4B/ajZbMtzz75c2d90DGyrSxX/X4ZyRUZt/hQ2UU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g56ApUS5C70cTs4FoGOipzSOCm8OIbQ94kmfkeW3x+J6/jPkI2t3yYYt76jMvW1xRzhmN+rU2g90UWahrfvB5+05/q9yY0D8sxDq3hlRA1pAZGAOMvnkdALD2ekohoDD8KZAYsMCxb1ACVNRIAEDkGv2sNkFztkoX08G57/Zl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2eChdZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuFafCik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2eChdZI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuFafCik"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kKZc2666183
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5
	tIIoGheA=; b=U2eChdZI4measUgiayoO7aIxmlc5D7onlACYoSWpmfuuJMAdOmG
	s3CAHxiG3NLop1T9LhRTzuucmj/vrjTjrdkWYL9Uj+So4g2aiBAZPvoyVZnOxEuQ
	Tdd3BMjVO3n2ChRiQv5VeT2mI1HfcnG/oMMrSqSN/sE2MmB8eklGLC75W0yDanSL
	k6/KjywU+nco8X+eUGHXaRUKP2iOf+cKmkCtb8xjEN/pvvy0vSJ7Y0xzn69eTufb
	zSbShNOnfW3yiML6l3rM2Qi0GShj25KBftUatGbK5cgfODaF+qoI+062wS5kXXLG
	XyzNmBZRWJO34vApv2v6fawYmUtyxToxGqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729he5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:34:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1104202a91.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789112066; x=1789716866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5tIIoGheA=;
        b=BuFafCik+Gbo7qLQyhageFIiXjda+NBZGwQ2A/EQqI4ohG70hQTjLrxqY4MmtRlRPc
         iHPWSMBwUi3rb6INK0aX7EYS2UukrVeGltVwhw6K1kbT7RxPdD32zNggghrk6wBZieYP
         HVHoWCf3MpM0jMyOxxHhzQYP5kCdOJSsbUfwL4/9ZUSS63TT6SJ0zkXrfsFmcPp2Fp7W
         ncy45PvMfdlmEymoN22q6gypiw+e5mX65JLfQ0+hCLt0yzmSft9cuVrEKrgfRTCk+71U
         BiQdMGxpigCo+PJ3DuX/ghk34CZJHMEEV5pNGhZHsLuLuxaPd5dK1viP8bVQMA3Qbovr
         inyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112066; x=1789716866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5tIIoGheA=;
        b=lF4oy+sxfOEYL/GTVbvp91XKUfTQNt/98N31ZMbc1Lel5wEoWbHlr1v645Orwa/q0y
         I2CaUV2iAFN66kq/RFabd1nfu3sHwncKOHK+utUn5A7RTu8AkkatnzDyBtsb8TQBmtMI
         1pzkZyVRgJAiF5TB78LgOmxmAkBBum/nB78/L84PUj/f+N93z3tcIzlM/NjtpvutYNP5
         Q4I4yaXUuY5odztmwmpguAxmTFIuafy518ZYtSXm2OW8VqZlxi5vSzrC8AxlQjPzE6pO
         byvNZqgtVlp+iqrwGrq5O2UJM99Cy3EIbYev/3B40JrEkuZ6o50/jIqbSNQyj6iMs7ur
         5BYA==
X-Forwarded-Encrypted: i=1; AKwUvBy+GAXBSgtLQ+D/QtssfnY+niK4nAd8aH45IRg2AKr3tu8oM5NVgOPv6dBJDBgmXN0EYCo2NqY5oMg=@vger.kernel.org
X-Gm-Message-State: AFuF++mKBjHBjpSIemRlrAAjLI1EInz+9ECxx69Lj7Bq4zdB4P2k4ThD
	vjgQ05JMIAFmTUkpqiUTae/LOH54BGYl0TuiDjgrbRtDAPkaV18JbGU2HSR1PY0+6yvqop05C58
	IN0Tj9sIqYpUtze8IzpozXiz6m+/N1WAYKw97c9EPH0rlp0U5VVwbmYisqiml2xI=
X-Gm-Gg: AYBFou1aLr83+WtrR98Dx93gURl6v942b0hKjptbzLh+HQ0gvL0dX/nsJjEM0jcmMUz
	kCf+GAKhJUJFRrl8Iwgcj8xlf5rm/xMJJEqteLc/q1Y/ZnprQjdARptKxofnC7YrHgFTMFUuoM7
	mJSb854K7BVrcGppSA+Csv+8YlhpMAukV3DzudMwb7mGSzi74A00f1rhlli63kZRNAcUDI/GPN4
	ojrtjjb62cWMTOYoQEO5bZAeFpv3j4cCOepvJz5+i02zH5Gc6SR4jB4JlgTwhdEDzrPHyUTUizP
	MObtHRIj0BKhUyEyczHmD0OqzTasohwtF5Pt1qZmb6/TqhEZxLSL+VUp7NvUydrtfFQtvW5LR+/
	cjnAdpueIK5teQ04+Wr9O0WILYb1V6t77zqAhll/aDOaS8ZyDWSEG/64ZDjtF
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr5177689a91.20.1789112066305;
        Fri, 11 Sep 2026 00:34:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr5177632a91.20.1789112065734;
        Fri, 11 Sep 2026 00:34:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm6163058c88.14.2026.09.11.00.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:34:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 RESEND 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Fri, 11 Sep 2026 15:34:12 +0800
Message-ID: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX+Hofv4kFbL8B
 dXV4l4icSAUxZNmlf4Hb5j2kOBJhsec5wjfqbi7YIW5Lyn3RNLd820EKnfAn6WP/8qPqBCqmJbG
 uUMW2vUg2yPnOZWm3wJSHgSs5Vrancc=
X-Proofpoint-GUID: zKH9_ax1XMbaC9HRvhorlCPRdPA3qxHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX9CXAkT5lHAvn
 PV9xSzO6+O8ylcqeaVFuV0xUnXRQ8mygVn4M891+5ruFphujbzxtIBeWLCyQbVgzNQrBWtQHv0c
 /MA6hdTrhir7F7GGn9XfKAS35exUzPDVZsK2Wnd+o4urVIG8uyOh8vyt6GJRcQSozvK0WGtiM//
 ubgwkRKHo8s8qyBi4eZtXRrAFWO6BeBQj5R9/yXIwQo8yrSttV24TVrbbpLbnHK3D4lf8BVNrif
 xKoPdxx+0pIv7yfQYKDx9rWwNA5QvLas112nMXNc7+FF4AUVqgzsjmj2wdxooyRiy7TdDY+GqNt
 l53XR3bRtE34vp1jOkZD//Ropk6I14BkgK96wzusjafbRnewq+CPIoeh1Ct7qfK4pqaJo9eMBkE
 iTCBK1c023uCP5ENxftxF6Z1CNJecLXfB1VpZJW2d7XYwVGwZfVX7DQ2pHQNjdzrrigYOqZrMXP
 4Mys3G65m1/gkKzemRA==
X-Proofpoint-ORIG-GUID: zKH9_ax1XMbaC9HRvhorlCPRdPA3qxHo
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3af03 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sth0529Ve8dJX5Jf890A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110104

[ Resend to drop v1 Link tag from both patches ]

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

