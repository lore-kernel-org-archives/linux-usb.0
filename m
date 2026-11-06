Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953652;
	b=4OFwLma+x2Vak1M7+Kyg6F8sc2waT39MzMZjOxYbKqDFozRdjlyzMesJB5IueWGG6J4J
	 lpTjX8VN/ZFosw3KgKasSUXnSaHu0yz3j95uBXw9muK+QEAN2Yrtlx9iVwYzxU9YPZ4YR
	 36kFzAA6CgGaJa/X38dJey0uSfCt5l36xCQbwvNzL69Vem00TAtIq6TolO7WoyuFaIODy
	 cvtbFNpmUWQuwXyJo6UZEsy8OuPNpnn6ODaS0QvHpYV3MzdvtPRxE0XRRK/v/stdrLjho
	 og/K5WimMVFjw1a2A1m8MNqmKA+qmstJIJMFSNHqzeCdf/rCq3ckITQC/okwKsOi+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
	b=pxwbFjUZ+ey1x82k/rqBtaWRrO/7EBITnwOK9ca+iygIF3pdqiKUED4eoY6NaAscvjBV
	 HwXxmmhD7ScKHUSd2LXe3BJn3xyZ4Wo/Kp+CBrOZ/9bHPjyFwhs2+X06hJwvwTvt2IFu5
	 YxoQi3BeagVcbIM5O9Q+mXA9rMB/sfnRv2hPA+Zj1FkPWVJlyam9aJk4sdymt5SWP7sGy
	 M5tfGcQ+gB7ownoGJoAflyJl0SqW7+E8X6DTVbjKxcKuHzk3lWn7F6kq5raf9INqjXpvl
	 EWlowme00Gq3nXx4m4qZGM6free95cY9P0bed7UgT643UJSgDF6eqTPZrn63fdVAP2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Husz4Ph2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8rLLhxZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C324A606A335
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C324A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Husz4Ph2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8rLLhxZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RTql2730720
	for <linux-usb@vger.kernel.org>; Fri, 6 Nov 2026 08:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V2wYRQpevpC
	b45SBy3n0W/fgsH08qxa9cpiriaBTcOI=; b=Husz4Ph25FxvMw0OcQN+Bo5d0ho
	eL9lvD29FR5ZRPzyWGSLodCVGDtBzNjTatbO+Q6ac8XZZPmoBVbWF42KrWz8k/9H
	KahRA/gOJNG8rpNvRdNRFHhyXvjWE6gzSDA6FBRXmU/Kf5rrqdCR+4VLppJVtinm
	dADOptrucQHoBxJ9YSjkuI/TTgsBfNCHMY/VVnPg2W/c5RKbccUxVIviszFiMr0t
	25/u4dtpcIKSyGNbEITEgzA0Z3TIQLAyBdnilweP97gCG/gkiadwrL8oYwnW5IYp
	ZjIV4jLpHRqM33oahqpZmFrgM87G/iE2h0H8m/Y2irnwVtv5UsDOrNiKEQw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9htx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 08:27:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso486546a91.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953650; x=1794558450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
        b=c8rLLhxZLEv/uX+vz0ovzWDe61AOGwHyBYUl+DIGSymgnxUy/od/+PXPt3zLgaR5K9
         iMSga0CwZQxg1wbybRpiWblAuTOQx4LaXxqjL9+dVaNrnpOZIfzS1FIpgfmQGFGZSzR3
         RiSgqtWwHAlNaaKtG6f6Y+Vd5Oshiua0546oR+S9XAYILH/+F8qRFVikEKP12fFa3cKX
         F+1h7bY74J9vZYgpUTnjWzaSiENLsRX43uFqz2H3SPj0a4ypuOZiAK3VYDXDA15hL+0j
         Rw07oQxDk/EfB5bhoyZCgfyBzZBg3zZkxorU2FGHdd3xdaPczwE7VPndumuIXhzhbHjX
         1kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953650; x=1794558450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
        b=UZLId/eFqeghr+2HsS3h6e60NrAPPRXdHvaE0gxM1TaNOaQ0As65OiLSRNr7KUWHR/
         E9EBIUfyuFbum+WfRYVDaItvxOrCxmOWBINiRYNwPxJ2oaBUElZWExYvveGCkx+u9+d+
         cFbFgRPBrF1VbmvESYvrlowWCrtc9dUvQfGO4v6dHPgBl+JGWOSfCoi6DVtuugmAE7Ra
         KYmHCBrLDIq4WsuEWCjxMEhXQBEd7cnS2JVhgQopk00NH7419nyjz2lEfrOzs9I5aTSQ
         P91NY5MZdDRP6X1PAqVDUVOsV45RKENVYJuoX7cnOD7XPxdLGwpRMZjnAtsgpSG2DHB4
         ImnQ==
X-Forwarded-Encrypted: i=1; AL+hErHN9xHC2b5LxFlcuVwskhGGEHe4YwuSJlmEEoznktzlCTM6Ie/h6ajWY22p63+5tQYSEO7obn5+0xE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QjsTml0VeAhuch8+R8SHTuq7eg4J+WmBi8etJYSnkU7sx5HPs
	bKKLyDcASMsW3qHvETSna8PVP6W+4YvKcSiDBIR1LPk2iERFVTLhN/k11GEKLoyr4QNQoKgSHro
	1dkgwxTqmuUMz/91l9mDgL6iLrSr0ntfFArBAA/7p06ZjVuQIMgrAdFgrQAKWo5c=
X-Gm-Gg: AYBFou0VUd4sGhBVDNg8ljOl7lyDl8PcUMZvwBfWS+r4PWm/3fq/Ta9lw0LEBOyx9LI
	vd4tksP8mervF0x9tPo3IdKRlsYWhIpE1jJZpdNPfx9P59cQBBFhzMzeGpODLOJQHVZDKTrjSHE
	lFcx6NXMWQTNCelPvzztMrIGR4C+G7cY2eT4JoJPrkLiCRFEpIcNa236KKq7YI5mipWO5z8BksV
	zfx6Wv+qfXyQXwmjXvfZUajN9OkbpnimoomPkEdgGDkxVRDg3LiNd9SToyi5U4zN+qfHA3w374J
	ZSnt9+vsqb7+wVPnr+wkXorhkbiH15UoMk4kb19W4MVpuf/jodDZqdNbz9SHXqBLALqFxi23yWo
	6Lmn4KpFgpWh2tHhnlNWeWnOLGRMZOyb9Ox0OqkSVMBO6Vy9Cqi0J1xZQkIJ6VcPFLC9nuAy6Ef
	bLlw==
X-Received: by 2002:a17:90b:2b4c:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b0db5f54cdmr2023384a91.7.1793953650330;
        Fri, 06 Nov 2026 00:27:30 -0800 (PST)
X-Received: by 2002:a17:90b:2b4c:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b0db5f54cdmr2023366a91.7.1793953649879;
        Fri, 06 Nov 2026 00:27:29 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:29 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
Date: Fri,  6 Nov 2026 13:57:14 +0530
Message-ID: <20261106082716.128968-2-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: IPhd-EYmxLNOdNzCqLTTy050_YD3bF-_
X-Proofpoint-GUID: IPhd-EYmxLNOdNzCqLTTy050_YD3bF-_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX/+d3BhVZKa68
 ZiEjlUxltM7uy5nQDCHV+mo9P4U0ZUTjINXQAVUHn4YoCFcpLx0kBEno+UQ6kSaH2tQHwdg30V0
 qPMcCG5O3igERB81L/nPxhnb8Bx719o=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed8f73 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LeDc4IpKX6SiiW4862oA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+RPE9nUgmQjg
 HeTmHUpSS/FfP2ayCnXlEYQWJMvDiF+2NPhVnw0FK+pbrumD7SPUx96FwvMH3BvZ7yDa1/fMi/n
 vrxJQYWLjytbqRywSEnHoAtWzNwAIqwdIC7R3IxBdRRJrh6MmAQqJWnx3MBsJXfAHvH/jcmbCNp
 l3ckftgd4qrPjhbtQQFwtkArnGymUkdLsWgTBq0LUIT0Cz2Qc+WWbHl82pNVAdGrq9GPmbdqVD1
 9GCbW75wscSo4iOTaiMOZMFgwTj6PfXbPFsvEsMOMQfTVcX7LrCcqL2oSpSbRU6TAqZfYNtpNEj
 Cbj73cRSk+F5d9GWpS21j/80toCmPRHMXQeCjmgxbnFYoTg8/EokpYrbLKmPDfkmK/S27UVtXsQ
 xSJDOpRnTmGqQaRdUIUyrZQ1GWWmxafSHFekbiS1/YBHoivsP77x+BlFwsHGZXMZoC8KmzAhQP6
 FEiWIa1/aO3YWSYeTVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

dwc3 core only calls phy_set_mode()/phy_set_mode_ext() with the base
PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE. It never passes the
PHY_MODE_USB_{HOST,DEVICE}_SS/HS/FS/LS submode values to any PHY
driver. However, QMP PHY drivers need to know whether a SuperSpeed
link is present to select the correct autonomous-mode wake interrupt
mask, and phy_mode alone cannot carry that.

Add enum qcom_usb_ss_state (UNKNOWN/PRESENT/ABSENT) and carry it
through the existing submode argument of phy_set_mode_ext(), instead
of extending enum phy_mode further. UNKNOWN is the default so callers
that do not yet pass a real value keep current behavior.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 include/linux/phy/phy-qcom-qmp-usb-ss.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h

diff --git a/include/linux/phy/phy-qcom-qmp-usb-ss.h b/include/linux/phy/phy-qcom-qmp-usb-ss.h
new file mode 100644
index 000000000000..4da4d71e977d
--- /dev/null
+++ b/include/linux/phy/phy-qcom-qmp-usb-ss.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Shared submode contract between dwc3-qcom glue and the Qualcomm QMP
+ * USB3/combo PHY driver for communicating live SuperSpeed link presence
+ * at suspend-entry, via phy_set_mode_ext()'s submode argument.
+ */
+
+#ifndef _PHY_QCOM_QMP_USB_SS_H_
+#define _PHY_QCOM_QMP_USB_SS_H_
+
+enum qcom_usb_ss_state {
+	QCOM_USB_SS_UNKNOWN = 0,
+	QCOM_USB_SS_PRESENT,
+	QCOM_USB_SS_ABSENT,
+};
+
+#endif /* _PHY_QCOM_QMP_USB_SS_H_ */
-- 
2.43.0

