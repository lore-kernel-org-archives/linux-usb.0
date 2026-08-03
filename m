Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB5382F1F
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748497; cv=none; b=W2veFI84Jzrprn3krkvEkYqGi+wU7dv4Tz69E1hAYBFa1LaPlVnzeDD8mlS0N8cGKc4+B852OFh576F0FxFO0BvBtPhIXZLpPbvocfJd7iNv5XVJ2nzTS8NZKjjQOZVB+r5tht1KZYqj94b2sMOgkN5Cs+Ef7WFmshLL6Cy1f14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748497; c=relaxed/simple;
	bh=7kCN30YZaTtO+/kcSW8ZEQJtgK2koS6+mFzf3lGmhPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLzUkDZTETDA0dsZWHjtSrL4Qh2solRWHj/Pne+u6EekvyZTl6Q+6vSZ4j5Bu9jfoW/6Xaglg4Ad+yttfPAZJhxZ4SW+VxGVLrOmDn5nrkpkZ/4zgL/hxPkM7bxaIpY1vB7xiHAwuE3V0w38N5dukEmX6Vfmm9WXzqWizCeIrEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkVQdu+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9oqdlmN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkVQdu+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9oqdlmN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736saIN3790826
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 09:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3jlF7a25JOXLzSC029jPZdxCM48HKf6MZPs
	BhRls358=; b=JkVQdu+rTWbuSiteCnQhY2oBwzGX93WnUuaHpfz6B4P1ENZlvZj
	2ipnlRVaLzncqNmfYH6693TDhz8CIvAxd7kHV0dyxTP1ckCX0tizDkg0OxjfGF4l
	MXtqbMT9w8lJS+SD8UlMqRXzHY0CpsHD5icZEKxzhfQrDCw3t1Aod3EEfTRFE6un
	UNgZsNA6q/DjC+KgfBkuc/r4Acis1XpW5WH3Qf+beUuFozH1DXsMbSs7J7YrF21H
	5WTqn8Jup+nCElR+gCf9V8Hbsop7WXK2Rp+WL9eAQYrk1VdRt43qnJ+/39AycWAT
	C/u2erVPXmcAmiS3p0br379hapiNT3J0xxQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0n6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 09:14:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso4817894b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748492; x=1786353292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jlF7a25JOXLzSC029jPZdxCM48HKf6MZPsBhRls358=;
        b=d9oqdlmNBjW6EJiPvjjIC73WudsRHPYAO+xp0Dj6pYK5SajNfwGM9S9opBPfYCXtb+
         KFQBJJe9X6ngDSfnY9PodFSkNgMs6Iu1JumiEsvWEX3zAjb84aKM0KNUqfIQ7YIIMKJB
         ckwR9vk9emBzhY8cALsAW2Li+YpLTZGJGfkYaNcAcUhWBBzAn4Ez0ahMv2e2WJeFjJRk
         mmF10w7PrlneDU+p0uTYTtfSeGtWs1UuRxa/M5Aety+Tnk+gmcKn9XrN46cmtEiBSE8v
         NcIqFTUtqiWxEKocQmiV5oZRosyGYarImVE0xJqA/mqXWUt9L6ygmwepZ9Tknh4PbBM0
         Nppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748492; x=1786353292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jlF7a25JOXLzSC029jPZdxCM48HKf6MZPsBhRls358=;
        b=FzgP8m560sBP9XwGXw3QYKrKHTaQosm2rYfH8YsiBCCelbWVBu9txBVjzVAQ1maFjM
         xUc0suwx7+UB+k0TkVfEN2UytWAX935pllzsBgvMKbPnGe1cpvMEiPJKbjjW7cly1neY
         h6U6rRFTHAGK0arF1wtjtslZsQAilTlG3J+RSGkQx9nvfKW1wzBUko56LJApdGvoquIV
         3gFMcQZaHJQxLcGFBxy5i7oMk9bUszTlIvu930sameNyRuCskGTT9J2DZE4eB9yEL7wW
         qmOPrxzuWAEWQ7v1bhDHunl3PT7nE0L1+wulPn6Jiaq+xDmM15kd9UD4zzj20LiGZ2yM
         Oraw==
X-Forwarded-Encrypted: i=1; AHgh+RrKeryByzm5BfyqjPcmfRWQ/hyRn2c1BUm0NVEjl1HSSZUZ7iK8xXKuRhEsvAtsBfsB+pn4eZ7imq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfU5nShnaTVW58XbJzve/+8BGXUsUIO5CU3T2Mi3k6v3IN8L0
	QqW2KiNa7fWS5vdYqzZx3XzWEFImfNAkLKDWP7wRZZ3+zwhZXnD5sg2Pd/JEotnL6Hw3RXvn19F
	X37e8kCZhFIADDt/TpeqKkLGyUuX7g534yXYG3O/UGm0mO2blDYWAekXy3WvuO0Y=
X-Gm-Gg: AR+sD13BGFAWiO7h60ZDkLvd1/GNPZEFd3bikIW/nFa+XSjJrr+fh7bsXcA2w9UafT4
	75fqGjt/Tixhht3SEw55HgPIm7KK7Au2GfIqOAybRDfWRGrrOC5SR14F6rc+LaArjdZraSXJtPI
	fVPX4avLEqVRMier1WSncr8uAUVc7cg2ceyl2vn0Jf7FD0Tn0CAyludpSgT1rB5K4MapUThiZbZ
	uEbUzJKIMYhnfzUA33p5M4wwSwH9AusBwrykBh0Wb4qzU/lFwiOOmK2xua7v33P9C1MM4Kc1re2
	nmNQsAaBOYQIW9l6vWFcVcmQ8DNQFNekqesqOidVW6zr8ppyiOOgPwCjNfglUE62q/mFSjDOXLQ
	qoR/TyUjzHnjE+0ZucbTldFu8az0=
X-Received: by 2002:a05:6a00:ad1:b0:848:2f2c:b2c8 with SMTP id d2e1a72fcca58-84ee4821879mr8717659b3a.24.1785748491834;
        Mon, 03 Aug 2026 02:14:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad1:b0:848:2f2c:b2c8 with SMTP id d2e1a72fcca58-84ee4821879mr8717633b3a.24.1785748491248;
        Mon, 03 Aug 2026 02:14:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:14:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 0/4] phy: qcom: Introduce USB support for Hawi
Date: Mon,  3 Aug 2026 14:44:37 +0530
Message-ID: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a705c0d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=y5t-mIDxVrGwD0Vs-1YA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: VcqMcUTCUOSPazd7kaYV56zL-fcs3M4p
X-Proofpoint-GUID: VcqMcUTCUOSPazd7kaYV56zL-fcs3M4p
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfXyJxtBS1rim7H
 22nsglG8jTKTZK3ID1o324G0AJOTfoo7qemx5OyevKwZr9qItWPzmw5aRuMtNcvf5gAJtC39diz
 yd7nzitDKidiUxsOfom1x3rxS6IZe2w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX49yOTGlFAp9i
 feXs0pI9nj25XB5/v0PjMwoiipbwaBQEs+RgWw43TWh3s2eqDm28fbc8lbKBKsAF6sybN3T9cKi
 Eu19ywUfWQpis+GsyYgpcMbGJzzIWueL4cQYjUgzHt+CBOvtIf1AaOZ4Lh/iaejOQZUhBxsLWHB
 PL8TwBNuy6CL6MvCj9Y55ewGH2TLV/iWgiV8jDE2iMIAn8xVMnE77HRRz8chhdR7gVjZQhm4rqD
 5ScG17p6qWL7AoX6XbMELXQAdkpCFIaQVcJ1yUwqriPM8ClPhn9eTaJXx1GCXSonK+xFaCV5MsK
 OjSRHHEd+gvpAyuagPvKvDerGdiJ3yVCRaJv0wLg5NrF0ZHTxTjhINjMZ6inuYRz1xypW6ymx88
 itNvmkMRMnkk8Gox7/cs1MCYaW0JbM0F9AFEwy/0NnROkw4b9VP0o74s9hrdU3s7nTjufxpKLtx
 9JhycwzKo9+i7hMQXdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v4:
 - Rebased on top of next-20260731
 - Resolved conflict related to recent merged common phy headers
    from pcie.
 - Link to v3: https://lore.kernel.org/lkml/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/

Changes in v3:
- Fix missing version tag in individual patch subjects
- Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com

Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/


Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  16 +-
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   | 116 ++++++---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  98 ++++++--
 11 files changed, 459 insertions(+), 70 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h

-- 
2.53.0

