Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924598;
	b=em9C27ui8Hw1QEWd/4IkNeGnJDzqJhF5tMs6EpYjklxvmGl6bWmSJalkhSOk2O0EIGKi
	 jQrVTgOGnpaijlR2rhYVC7pRfN+PWRW6cN+6zQDA44ahi/3XOuq2iy5uVB3YC531Xm/1c
	 9R7VbW533NorUEQmp/JQpPNa/qE8rfOm7M3HMhvhDJ9tdZ3d9op4iNbH0FPgfeFsLogg0
	 LCBMDEjuZSiq8dzEFBT/A0hx5yyCj9Bt5Old1ii4UkE7SRTjZg/kHqpUEfHhO1nv2oqKh
	 ipDe4II2QNzMGPbMgvm3dFv1vPbQu+mWYR/d0jVUUsVEeBCnXveQRrsDuLpA7nFr0vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
	b=xrBBJZmJ/lPs4H+wPnOeOzDrfIW1EVeWC44DjOpw/hTGeNyRd0xh8A3fqxiGUTcgGAl2
	 If4QAQigZKHDfJaR5L667G19lC/73zy/FoPGtUNkHbDdBtkqco8YH6YIDTequN50iP6Zq
	 APYQlxojHYq25UPIVpFtOCHU5ZHQwNwPErALP4IPXoYhD3+eRFsbetHlgsZGRPpnz2gIu
	 dZrUEpxQlMFcn0qSfUJqNcZxPC43Vqf36wVys00RtYMWIPnO7feHzswQ9l5AG3W8cLgp3
	 0HdwLvR8HV8YZy8hS43ble0F6MqGLdWN6mY+FxJ4tCAR9AVwqigMj4fh2GjXuJzAEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aZTZmH/g";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N+Ik/OZE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E64606A330
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 14:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E64606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZTZmH/g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+Ik/OZE
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0rIj1208485
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 14:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=if+Q2iufyNdZSoNqm8U2yc
	VdXqkw9sljJMepLaLmTxQ=; b=aZTZmH/gtGpTFuLwt0vOa+5UdMpeAg4N627XOO
	aYUMFp8a8XpavTRN487hwbVIExzpES+M+pmkDfUcWmh7V19c9mS5cyoWlbYZKug4
	/wPRHny4t/Y/H2naH46k1PMa57yj5DJbLUKns3ggU0tfWq6369KImn3kr7aRi05v
	0+U6i4w055SSH93NXUzU4ZJwelTX3GibLQ/xGNenlGRSWUYc5iGpdGRb1e1V5WXr
	AyK7vSFAzGVnpoQAdsRLl28WbLP7653IDKTSXQrTOQUSPy2osIGg2LAiudM3wqWF
	5DgK5YOaiSiCZLbm5VpQEk0JAbxYpo6wI5ZpCOnnar7OiOgA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc9ag8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 14:09:56 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8628955a085so6094638a34.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 06:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794924596; x=1795529396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
        b=N+Ik/OZEdvOniVrOcFxNyWdfAZptcK8uS5OXhyr8tz1Xnl7qvNH7AIBP71Ay2oSuOz
         37mNrtcEfdekkFIJA7SU/IIxksDS1JWkQAu4rdfi8V+OG95Rhctn3t6OsBJtSkN1W48R
         YMfLia7vYBTvle7RmxQjDvKYRJyuRjTUKtQP5T5rU+bYYN44Y6R62VtR9MVVvGG/K5LF
         LnXEFBHCr4lqOXgjxqHoNX9uPPucbm0WyDC5ofRA3YLG71CkcNZPL/lRqVeZvi+6rgkf
         LduZc+LBEpjRewkmxGz7jYgcl464qhfkwaPoOfKjjRhTsb7xN44XLBGF2R+uH7vfmgth
         foFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924596; x=1795529396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
        b=PviedWHoRRGszBlx5azIUglMg45Q0cyh26WrOLFtZ5jhj8SDcmEXx9L83txUDzGuBs
         8t9pYow2UcL//vvaOpWb+E6lSgVGj8zwPYqGVb+dWTj6iosHzwrzNTSUkQducg7GC8Nn
         NSa25aY+pBuqORClEokev2PIMQAj9axjiHGZrLwjBK8opEog3fUGNWKMlm6dsUZk8VZW
         mFiSSsjGrM5y3ahDxIA0RzYmn8+XqWMPY9seVqy00mmL9pYoMKjiwLaL2Nni1HQga835
         66NCGfVMDjG5/baBC53Dme48kLW9SrCxjWM5ogFemK1ghSg77wz/BM9svjR8dNsaiY3B
         4vIw==
X-Gm-Message-State: APuU4Z/S0yngDprZ7guh0lVtoEZfqkbrgYC9fmMwP8EZVCx04gocnlrn
	Pfq2vDR9zlmyKsQPainJK3xwjvmPEExriYy8rORVscZbcr/4DhSw7dgBNp8Mk/L+fh9JWNuUJ2V
	iZ8Fxp6Dmcl6uwhEFl5TMovgNTHAeQbjqXLgCTIJ2iNlCoijBpnheUJFSbYtS38U=
X-Gm-Gg: AYBFou2p4SSICOENIO6wMGfoVRQvlwRZWW/lGjduBFzDvFXe5SBavei4u9LPciZi+X/
	ElqdeBMaxDfCukvNprKVw88W4FroVBhIWjvHik+eKoNVXaVGPO4cZGPKrm70vGudBBqhwlsm1c4
	zHbCSPfhshyOGnPNlvgTyF7ZEbdzoZ/ig5WXhEk4Zp75V/EvJoTjx30bUwli53Bdx+pBgudgN79
	1LQZDawAkPhq+z8O00+h0qmOkhdojO7++6Ez/gSgzLq2+RbnGc/hg+hjpRyoLw02ZVkkirxlbRC
	KK1FhR8ohRyebT/NBiLhUgyA/WaqXXcMsB5zROgbcT4CQ3m6aQR5Rtg8hAOgOObJCz8SsbZeLwT
	IHAUI42LepMcWIZe1GYEdC0A3QWWLcFWRSFgcoXz3xv1KT2VyFNhu49y3KQTacxjCSMnw/c6w0T
	7pMQ==
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr13341452a34.16.1794924595747;
        Tue, 17 Nov 2026 06:09:55 -0800 (PST)
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr13341423a34.16.1794924595370;
        Tue, 17 Nov 2026 06:09:55 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862d68aac75sm3233775a34.23.2026.11.17.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:09:54 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: typec: ucsi_ccg: Add CC orientation-gpios
 support
Date: Tue, 17 Nov 2026 19:39:46 +0530
Message-Id: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACtg/GoC/4WNQQqDMBBFryKzbiSJqNBV71FcpJNRB6qpSZQW8
 e6deoEu/sAbeP/vkCgyJbgWO0TaOHGYBeylABzdPJBiLwxW28YY06oVEyvEQaKCqHN2WRyFviJ
 rDfmmqkHsV6Se32fzvRMeOeUQP+fQZn7f/52bUVo53T90bbHt0d+WzOWyuieGaSrlQHccxxe5m
 cy2xQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX9M2s+7jOiUi0
 nYfY+7l1UQmZywIHstJSpW7HMERCbOpuArvNL4JibYqBaVRBEujeZf97Ea6u3pCZl9VXwYy5kRD
 6ewdZQOVOj7irUpFV0qnHQIVP6rtBzc=
X-Proofpoint-ORIG-GUID: bFPNGMHIkte0S_aEr6cI3EGRXO80yCkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX/cqyMPa54JZF
 S7bcTb1/JHgsU/qaBYJOYiQ7Y4oc9lfkHC4EU36caLNx2P9zwe8/SFfeR9GYuVF2fFpTTixpcQt
 wbvGjXxipSTHbpDSU+JsEp3Sg63XQZWxmeYdjU4OI+QS6Nxo6rMk9ClqZWYGWJGySTxQgwHDu0P
 CrgjO/8+rb8cR0UAoGroBLY6AGeBJPsFyXJC8W5eODoEJaOFuDfcncsuc8jYu1tJduEbJYAp0VR
 Zjz09a9RBZnZXQGTcbvhJ2ffd2WTnZC4Ry6co4G5RldsYuE325+7mITd4C784uyJCHr90BXL6Qa
 DEyN0QQHNb+kB9K2NW5lApnbjzHQ6Rg0aG+Q3PpkCbRr4zkJBa1VqFvrWlCH4CiXHV3Ad/RFS8Q
 MtDGNDbdoUDke7blqMlSLUNVQ5Seayjt8SMHd2a/F1dRjAxgKX2lknhKE5tg/Qg3AGdwIa6Zbcw
 mJePyqETkSxQtdHfRCA==
X-Proofpoint-GUID: bFPNGMHIkte0S_aEr6cI3EGRXO80yCkx
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc6034 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OciRnzNh6Tf4It2_ZlUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170056

The CCGx Type-C PD controller has no HPI register exposing CC
polarity, so UCSI status alone cannot tell the typec class which way
a connector is plugged in. This series adds an optional
orientation-gpios property so boards that wire a board-level
CC-orientation sense line to the connector can still report
orientation through typec_set_orientation().

Patch 1 documents the new orientation-gpios property on
cypress,cypd4226.yaml, ordered by connector number (an entry may be
left as <0> for connectors with no sense line).

Patch 2 wires it up in ucsi_ccg: acquire an optional GPIO per
connector in probe(), indexed by the connector's reg property, and
use it from new update_connector/connector_status UCSI ops to set
typec_cap.orientation_aware and drive typec_set_orientation().

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
Changes in v2:
- Correct sender/author identity to akash.kumar@oss.qualcomm.com
  (no functional changes)
- Link to v1: https://lore.kernel.org/r/20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com

---
Akash Kumar (2):
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c                  | 76 +++++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)
---
base-commit: 2c46a57079874df3a60770278f08404f5d0f782d
change-id: 20261117-ucsi-ccg-cc-orientation-cd3e221ed635

Best regards,
-- 
Akash Kumar <akakum@qti.qualcomm.com>

