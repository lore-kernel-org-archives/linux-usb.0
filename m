Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719582;
	b=XH5u+axDA6HhsZoTtU86mn9U9ddVWL4e5wJXqZbWwn//DDNF4MRK60n3Q7/5kd5jUmgJ
	 N4xHLxBYokcHTXHHRF6+cOzjBzcfFGNaAt/FUJD0NkZ9URmFKUwxAHbnrinnrLwqzNMvL
	 j40jrcO9KgVZN0wZmN08uEmzEoMSyCRYm6tSwnUx/ctk/Dsv9gLEBfOKNHcAn94KuImPR
	 XzzZzAMLG+YjZzdPish3M4vadgzWVSCmVtlLs+AKyzRgCnXfXNxXH+hBmfHoLdC7Wiose
	 z0kEN9xgA+/fkzLxjOE18HQLfhwtw/OJzuLIWAHx3dZWVzbLjbYMEME6jd6MngLPCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
	b=tgm7y5wsmnIk9rJvFP4h0MWcAyBSvRMUGKpK72drcEhqjZuciOt2tKP2dyTK3QUNvwSq
	 y8CDtV8WU5V4V/ZIh7OhiCvixkyQejt1E3falio4aShpA5Xdjy0YmySbkyA7HZ1xUbag5
	 M2b7f5gEtx6KgD3dD2RKSV9g0uZ5Q5rh8EKsiCm1knnEg1YnY91TOnTOdCKRlQ7vfQU9h
	 gfbxqu28UZYCdWs86YYURtF11tpHGvbCRJsa/y12uPv1mJaD6Frvrld9ECVNrmIXeN8xN
	 p0UHHlh7eXYfhaXlqr7n7uC0d3sMJv+JH6UmsPxFRSn4+mJLjhQS9MobGUbx2gv/4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu9Wzjj7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2uKOJtf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A8A606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A8A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu9Wzjj7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2uKOJtf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuB473850614
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PKnwJGn1kbNBw+OYy82caU
	/JC92cEMMnvBlOquiaj/U=; b=Cu9Wzjj7rorA/u6iXgCIiQ/SUnhbjxcPw6D0t/
	yzeHlTiXtf0S0fhhEG3F6gbCIHuUQlx+i+YHFzCB6PhjrA0adrp8H70mai82PMTq
	3FwFFSniXsdqIDXBFxDPvwHI9e3WK+vS4gL3WWXqmQgf2Fo7O6jXtDDGf8VNDDXM
	dtvdXPnjPDIkHuRb8VD6Q0ie+KWvtyx2r/DSja2F/Q3tyZHKGZ4R1W5at+Ei7KO7
	a9jq2aQN/f8y9gjCmwG4FEV4LcPcrnzKK+G9Z/rHW4hxuS2MIXIS9HZqi11WbM9g
	ZsmoTG8dX+QucmIdvvpczclncmDj77KseVifa0mP9rDtU6Bg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7ga5xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:59:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so18281670eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719580; x=1796324380; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
        b=B2uKOJtf1AV0wfvdDz+dei5DW1Kf5asGqvbZKU8kjHeVSiCa7YUZhJBDGZV0YTti9o
         SvF9LDld6HaRVDLQCDT3QlrV8auMvxLtdIxK3jvBs6cRY6JIiaw4t3DNMdTYmsTLLUBM
         hFj/JOHzWxmW0d5D4CF1gesUghyIysv/YVTQbu9pcjq7JO9ECVTCW3hjS9BqgPLCVUpq
         k+l2soD/ZKhn9OyHGmcdueSHXseFDY+bRMVr51cW+ljxWWngJjUe462J/ZCWy+9J6U4V
         vAzC+kAPl0Hc5m44O0n+sKab6Rwy6vmF6Ux0HaiM0ALh3+/XXcBFQfuV2o0RyYCZtyx2
         2BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719580; x=1796324380;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
        b=V55LqB0WACSNDCORkAEWKUO3VvgEJmtGBofn9g1iY73ejBLLcVL47aknw/+HMw57Hz
         oJsm8GEbmCeyuF2A7Q4pfhA5FXA2Oi/eQlNcEcvWq5Y4HfOCPmhCNN8xzBe1VaWPvM4I
         EqBS1KCR2Va5iqB7c++aN3KEy0pMK+3QALAy4iPOANuhrSTjlz2Ei7nyUzPf2KL+Uzx6
         FkI3QpJLpf1FGzApFUt+A3DKKA9q/bYbw35p7jvAQr77rwjDC/N7VxlyvTRheW1s/ACi
         K1OKcLuW4eZbSKQr5Y/YgWwDjI4Hg08fFEBKeTnSNPzSuH27y/lmPMIGOEj3y/8BqPAv
         rPfg==
X-Forwarded-Encrypted: i=1; AL+hErH6vX0G1/FsrsbAx9DE7zzjHlVxbOxajri/Fgl6T6bGpNW9qWroIs7sUUhbrla++V1PHfcDL0Q9qA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M5tbDijzIXt8OapaIYOdXNmbL4AGOGuzdQPeisAB/7Zp19Dlu
	ew0sKIIMOGLdllrpF7SX+ERuq5XfKLfHbAnT7GjlyFGIAfIe6nUNasMuwOdYupicB6lL7l6dYx2
	Bhgl8ZT/WJx7iB0qGDIGIhnz+RiQVN8h9hgkottfE97Y27bUkNcgYjmwyGw0MMWk=
X-Gm-Gg: AZFdTZe+LgV3yrhv1sUCV6S6SP4r34GCu4+HEX9xnU00qUwNk74mvbnjoh77UBsU7cl
	uL2BOuPTIW2fd4BRulfL32W3tIoClWofybhu9AfH2lsfWPpcA4lBfcxe44s5Mm5vzem8LK/M0fs
	57Xlho0qhW391qxZkg+3iYsyin4ZSeAqLcQLLe6McntZYIAeGisX+rlu+xEaTj+NrKQVa1vAkpP
	N95VpvKocp2VvfoJA75VjJqqpmOaPyQgL6/6JOYRR0tZe+sOiKW5SQeDBvAu0aQEP96FVfktX+M
	/BL0weZIAKUBNyBQmsxex8fp00ph5ampu5aH+Ilwded2GgIdFOMKZ4BloC0mabjuXZ2TkyPaxNx
	TeGqZHHm88u2yMGT3pwi+CMxlLncTIBV4g+H9/vmVqgLi6oeHTOwUUNl/aG08U5eeEuYk2oXeBg
	BFEpjv
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr25262151c88.12.1795719579968;
        Thu, 26 Nov 2026 10:59:39 -0800 (PST)
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr25262137c88.12.1795719579488;
        Thu, 26 Nov 2026 10:59:39 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:39 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/8] clk: qcom: gdsc: Allow USB and PCIe GDSCs to stay
 enabled across suspend
Date: Fri, 27 Nov 2026 00:27:08 +0530
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAASBCGsC/y2OSQ6DMAxFrxJlXUeEIaiseo+KRQguRC1TnFRIi
 Ls3QDe23pf8/DdO6CwSr9jGHX4t2WmMIG+Mm16PHYJtI/M0SZWUqYJADczGInQtGaBAM44tlPp
 +N6pRaZ4oHm9nhy+7nt5nfbHDJUS9v0I+IJE+9RW75DKTSRaXkIXKSwUSZqcplvC9eD8mIrEE/
 THTMIg4ji+NJoQjsL5iI64e/jULXu/7D8gvyVncAAAA
X-Change-ID: 20261126-usb-pcie-gdsc-suspend-7a99c6b62406
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: xRfxkv-wOmd2lpf73KMuPV4JIdILAmUV
X-Proofpoint-GUID: xRfxkv-wOmd2lpf73KMuPV4JIdILAmUV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX9KJ+sD/T49hz
 HmB88iEa2S9ZPV47Ec2UNm5xU5pPxZocXc0sLBov2T2muZ/RHFpDzDC43+FtzQQQFDWYqHzCKvb
 aiP6i1tK00tu4JhH38XiFvD9SXTPjpeJOFvUmfPgj1yBUgisbSmLYu+7hYYIitchf7PDPx/28gz
 IoLIgFeWaNit1IrRuew5Nh9I3gH/2EFBQHHMyH1UmrDNF6uUhzHZBz/beMnHjifn9NWmqFLvl4y
 /Ye9IwkNeLcK1p7BbIwOnZRAeUnFV/OHthJJk9ON+xPTnMmIQ+wefksxucP6ntkASve3tliqRxs
 KkCxNnXgCD4gjitoN6NyPeHoZk4XwOLpmLjLyjYejBrMDGsgdfpCl54y8L/J8iuoZ9aCiY8hWz3
 sr+HcLPh+gM2nmNkSa6ZEjPp8d/E3BJtIH9xYfIdq7BQT8VdAUI4Q5S+SSe2Z6Vke5TukZeVzPN
 t85HHSkwH+ImaN2fTXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXyYcdJ8S7ddQi
 oSjIKJnQKDuVQ/jPUUX6ZdWD2+CjpbUdpYpxNcQ1vbGDCsOgAABX79MFhC4noyqzFp6wyVMHGBe
 bCtYdwTUR/Re/Ya3KyDCF5hYb3EOKBY=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08819d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IPO9h8n_qQbs29NzXk0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

USB and PCIe GDSCs on some Qualcomm platforms need to remain enabled
across system suspend for certain use cases, such as USB host mode and
PCIe non-D3cold. These GDSCs currently use PWRSTS_RET_ON, which keeps
them enabled after their first enable even when consumers no longer
require them.

These GDSCs have a HW mechanism to stay enabled during suspend while
allowing the parent voltage rails to turn off, with HW handling the
parent transition to active voltage rails. Use the existing GenPD
hwmode interface to let consumers request this behavior only when
required, and clear it once no longer needed, allowing the GDSC to be
powered off when unused.

This series adds the set_hwmode_dev callback for USB and PCIe GDSCs on
Qualcomm Glymur, QCS615 and Shikra platforms, and updates the corresponding
USB and PCIe consumer drivers to use dev_pm_genpd_set_hwmode() to control
the GDSC dynamically.

The clock and USB driver patches need to be picked together on Glymur
to avoid functional issues, since the existing RET_ON flag is removed
in this series. This approach can be extended to more targets in the
future.

This series is based on top of below qmp phy suspend/resume series and
depends on it:
https://lore.kernel.org/all/20261113103111.156476-1-prashanth.k@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      clk: qcom: gdsc: Use GenPD hwmode to keep GDSC enabled across suspend
      clk: qcom: gcc-glymur: Register set_hwmode_dev callback for USB, PCIe GDSCs
      clk: qcom: gcc-qcs615: Register set_hwmode_dev callback for USB, PCIe GDSCs
      clk: qcom: gcc-shikra: Register set_hwmode_dev callback for USB, PCIe GDSCs

Krishna Chaitanya Chundru (1):
      PCI: qcom: Keep GDSC enabled during non-D3cold suspend

Krishna Kurapati (1):
      usb: dwc3: qcom: Add support to keep GDSC On during host mode bus suspend

Prashanth K (2):
      phy: qcom: combo: Keep the PHY GDSC ON during host bus suspend
      phy: qcom: usb: Keep the PHY GDSC ON during host bus suspend

 drivers/clk/qcom/gcc-glymur.c             | 46 ++++++++++++++++++++++++-------
 drivers/clk/qcom/gcc-qcs615.c             |  3 ++
 drivers/clk/qcom/gcc-shikra.c             |  3 ++
 drivers/clk/qcom/gdsc.c                   | 21 ++++++++++++++
 drivers/clk/qcom/gdsc.h                   |  2 ++
 drivers/pci/controller/dwc/pcie-qcom.c    |  6 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 14 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 15 ++++++++++
 drivers/usb/dwc3/dwc3-qcom.c              |  4 +++
 9 files changed, 104 insertions(+), 10 deletions(-)
---
base-commit: 47588e4c16d8876d3058bcec030ed8a016794b9e
change-id: 20261126-usb-pcie-gdsc-suspend-7a99c6b62406
prerequisite-message-id: 20261113103111.156476-1-prashanth.k@oss.qualcomm.com
prerequisite-patch-id: d39d8cf075595b668e85fbc6c3cf7234c318602e
prerequisite-patch-id: 5f7421fa9312a84661ff4a87e946f315e8dc27e8

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

