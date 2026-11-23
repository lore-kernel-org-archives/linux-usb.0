Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425031;
	b=LLS5gyrewPj7krs8YD5FbZUc6+eo3ZtF3/ZmaamFlayMymHzKRGplysJqWHo/vH//hHz
	 vlua/mLn8KBMr6c9h40nG75MeAzxOtQOZM8BMKTl4hBiddF++hnjiX2epH/70mkU6aOvr
	 /NtsQTs5hDZQ9y9oiLaFCswqEovPfkPnprtRAv6HkGoHcU2r+uEBFZBsikzEXmwhsmmFo
	 a5TDtnIrQsYd7MkF01pXCrKaEtgQhn9ZaBzoxxKFPjnFFcx6w5ko6LyKb29VcLlO8A2ht
	 dKIn0Wi7rIhsG5Je0hNYM4K43oj35Gu7raGy/Wi61zbCJAFGqlBdjh6jKT5AKLPAeSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
	b=M19fGDzw13H8I52Jolt+lEDK4Lb3nPlrP8I7o7HoI4TBtP/bNSb5zHDhAAtIWF0V/yTq
	 TyD7fSUFcCfY5UYfRvjj9PXw0r8PaT6TySVS783gTZEOta0h0LjZvcKwx9EKR+Behnb3w
	 0DQYykHVxjR0WljqOrjRzomuFFdHJmaS6GR/tS41g7IEgrIaag7JQUuYhSqrzjzfLW142
	 sPXlfBDECo8xMBpSVkL14EVGIw1LVXc8jtHTtJbKQGHTcXL1HNjzSkmLuLf70W/Z/Ftu3
	 7EFactiWZJmGvwUnn6UOeioeUgwa4MNVL49tZhMmV+FJwNqsBkpGdL7Aa4PYhOLcGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gD4o9E+y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0B0606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E0B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gD4o9E+y
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6DYB61490120
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+
	gub6KOJ8=; b=QTu8y5jPqvdgr23dwcsORrMr2kFBYxoTCkR5Ob8HhGgwjsJqZnm
	BEK7IPo4TFAuRNyiIOFJ0DIMJN3naxKTAWcYallI73tFa9uOHIzaADMRjGQ9sQj4
	Z+QsKUDyiaRfMS2CLQ8tC3qEiKs8JzQqpQmP1uqpxdhDtJRIjj3SEVHgSRZgfQUY
	bBpt9r8j4CRP7I3D/I0pGsDLcKKyo8uSx+oxyBxYAhCP3d8dElXbp8DlYCtBsnkk
	smQh6XImGky/xAlmiUTvRnocH6I73U0kgsNkYhpwwZ/MqMb5b1vHbIB3Q3gV3dG0
	HgbCDPKB/xcofnIiewTqcPnl7+YAaz83Rwg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k0mfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:10:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so2559636eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425028; x=1796029828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=gD4o9E+yH/5ZSeTVDjfFTyQPZGEiT3c9P9cox2De68L6LOFqWCvHAK+x00SMu2VVfq
         eDDoB8qQqSg9GFwZ4rTqtPeT9mNNtXIsuLrMuptACoUL++Ikz9/LVPlJ5apTasXG7wfj
         2MtLFN3mv3DcLv/5eg+ZX25Dj4wdnTbv0c6d4hAHJk5DHcN1QNjpe/uVrB3SxUqQOBWW
         oYTcwgueZz1SIVA5vZXQ23NHSM0WrHY4++JSDhZw7RyySN7a8GhMRCgkDXUJzijShvqV
         /ITIHkmWm68lo4+Jnt1rbuVbEw/dW0CkNZfF8jYmIx7LAhU10QLvr/s7ksGVuBj67X2w
         hpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425028; x=1796029828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=YILfsvDdedZwWni9zmuipF+M0IEsiQ4nHV/sjNo0zvAfD0oOVg2u046jAMvAczAt6F
         I5Zx2elnubAPbJYzo7IbGhtMM41S2ML1EchNqrHKLwLMy983i/c0yP2gzXGjS/er9N7f
         x8wPXf7bsp1GzHoNS2wY11ivRsMQt99MHfASqdbbpcJCTQjSGouAkVgl+/iNq+ATfsAp
         xqjDXzveUrp5UBl7ycTCAWPu5VO7gL85QOX/SkM6GqWCvhBoLBd8MuErbGK99N/SpKyt
         M3LVuyVwSqWbRBCAwX9N5MKiBmmzhIxwNjIcvcr3lk/+piw9KKfTSGhqCoItiE847g9n
         w6Aw==
X-Gm-Message-State: APuU4Z+OU2MywirwvLdeqksDQBW1lUWYA+vCsqEHFPjjB14hpXvNeRip
	jCJ0ROk5t1o0e3ERL+DUbhTOPBtwoWmANFhWtHFXskzonQyQW9uPLPBDAH8BsQ7cZShRb3DlghB
	/iJT8XbZ4NqaH2dylCNNKU/u25lz8JhwWVEZcGRXe4rVkKLu1R2obCMmxzsngK48=
X-Gm-Gg: AZFdTZccpMVAnKa+ej8lxpDCRX8rUWZ+xR1Lkz+NtSrArhMObef2QkntyjlcwZj7b38
	7F+wvysbSgQzD7DciAj0Rzx+4DtP/SCfnEkAcvdaITfvTBRYUnoSyxsNJMhjBXzQHjC1po8+blw
	NlJqZO9pfOXfrBmK3EsIddxsCPe/x8TF3QuxBzn539zB3S7Z4+3jBPJir77CRKEy3eZ21ZywFIc
	7vk4ie+1Dq/CqFNRX/+qxRPo2NJGIKMBF9mp/6VXbYNDYOye6e9TnVNqB1n8RJUkt+lTF0OCbpf
	9nxhP0xjDIJqS7dhZZidB6ZyNtWwx+cjvzn1hXfiU6yf008KDF4bFooRdBFCcwVrVLuLno3gIqE
	EPoJMQkpNcHh7iy5lMycth/sGRIXeBjdNTK+rL3a5qMDVzd4sxH4eA2sJLGVqkAjcaS3JNOFGAV
	Hluw==
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6162013eec.29.1795425028452;
        Mon, 23 Nov 2026 01:10:28 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6161977eec.29.1795425027969;
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO
Date: Mon, 23 Nov 2026 14:40:22 +0530
Message-ID: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX4VxcIAoWuTwE
 ScqMNATSS3vvTF3h1otJHyxYLbVNFREK9MMGwWnE6q1hT+O+3R/BBX5WmvMWK8jMY+i/4Aov0T/
 N71ZEjaz/FNfSBoX/rSUkaCoqB70GCg=
X-Proofpoint-GUID: pb5DOBec7rTdBu7qwyHPzkNvczSD9xsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX5GTuNs42rX3G
 1NFG+1LEA4WjB9TdbVaf+6axG1JRgYYt9rpwtgiuGVcp2igxpJA1xLxANj4zX9e/OnTIr7JtUNM
 ovmkjouBSP+nav8NTUJvmDSzifTeszH+6V7J0nJIscwsdjkP4sIfToWt4StR2MK81uaALMvdcVW
 b7ni/P0UMagdqfrPeKcRngNeOXOQ3xOA6eEIX5BtyAHXh8r7y4XC2L0y/zDZ1pFhvLTxIW14q95
 rLsvbj/KKAjafvLstv7fQwr8PUWh/3i9y48PXgvnXkmuQaoah8X1R8cHs3k/yMJjVy2Lrh7kMXF
 JktN8wh3m4axan/M7698k3/+fgye30HrYN4OPWcwHCdGWXWn50N1/Uno71zzmqelHc1XGc9XDZM
 S1HEys7rZkBLhvGkaz2SAP7t67NyS7oZtv9rJ4rF1YwKbPSdhftcJf4sfCFM43RvTwS8V+bFR8K
 M9E4A2PaIWupvGhvcNw==
X-Proofpoint-ORIG-GUID: pb5DOBec7rTdBu7qwyHPzkNvczSD9xsM
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b040305 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ho7CR9d4k8WB-Yxh2A0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

From: Akash Kumar <akakum@qti.qualcomm.com>

The CCGx chip has no HPI register exposing CC polarity, so on boards
that wire a sense line to the connector, pick it up via an optional
orientation-gpios property and report it through typec_set_orientation().

Patch 1 adds the dt-binding property, patch 2 wires it up in the
ucsi_ccg driver.

Changes in v2:
- Reworked ucsi_ccg_connector_status() to return early when the GPIO
  read fails instead of wrapping the call in typec_set_orientation()
  in a positive-case conditional (Heikki Krogerus).

Akash Kumar (2):
  dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
  usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../bindings/usb/cypress,cypd4226.yaml        | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 77 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)


base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
prerequisite-patch-id: 0ffa67d7d9ce66074ffa2e070249ee5b0cbedb2e
prerequisite-patch-id: 65ba14bc52b50cdf47ecdce1f4b3fe678704955e
-- 
2.43.0

