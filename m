Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953646;
	b=ALmem94OczcuxsEXcWiCNpK0db6hGwiuCIEmZthk1lOEujF3OK97wcy5c3KBMPbF2qG/
	 0bxaq1bwXQep75MewofCLIbWufTLWNbeAy1OQYYfpE92dWMFV4cS2XjApq1sA2GqxYnWr
	 OsmXtVgUwYrU+xdXpiouTjfHoDWOEQcugo7oks4/HlJuGL/pjNzJpFsdDx7JdGDKFE0Iu
	 gvRQm2t4T11S8RupRsHya8Npm6y3B5P/zke9A8ts9279fNl53JOrwuePh+f3jzR7CBnAx
	 KcAlF/4jTDVrWGt9KRjtlIdXUsYjktkch9Kx3rv4TyUgTUiw2AQr4AK3N7yvm+PzISw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
	b=mHJzxrjd9rsnaQ/6Q9u+b5XzLfLZk45ymaC/DB2hI25kvbPfyFHRkoYZEdDsaIg1vgDI
	 MA9kW34GJ+fFkWkJ+uEj9CIWIk66V/mSyAbRFDM0KriYcYr3zLhnTRWvuq9Lp/FE9wwa1
	 RpTiUlAlYVdzMTj77pCdIoeNdekU7/0m/Y+2xEes1pCSVsZytvUMYpthclOqpo3TuOF/d
	 0686REbsUZoe5Er55ZzGX9tq9C+HZqNhX+Pq4q+hLU1MPQuXlCWXuLz1Qj5fLxSgy3wcX
	 T1deBVF67TfKZ59daRfei4UXWfnJNxGqPi4GildLzqmPIBZ8mjgB1NRG93sK//hQ0NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VAzK8f/P";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mn1RsARE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F5606D803
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E83F5606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VAzK8f/P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mn1RsARE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RBRC045288
	for <linux-usb@vger.kernel.org>; Fri, 6 Nov 2026 08:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwX
	j1Fjk21E=; b=VAzK8f/PU6/PwE6Sv5E6eILvFl//DgpBsZ43k45z4PJsbk3U49m
	Pp5H/fqHTAFEahXIRqhtpm97p6IjB5YyJDyAH2I1HviPoNpRfqRDlllZ3Vunc063
	aoMCJzqpUsdsIMjAHgYEwbNTfAUFOpAK1G27JjbGcsNmok+mj9QXJSTfJ9zaDxKw
	j164fGMhDakTJ5NvgMwhk2ojwklk+DwRoB4Yy/yWVdhcBEUtUfCbdPVMbl0CbAMh
	QgDZ/5tYLYQ9SQn5xw4prsVB/SVlarEsknG+cTyAlha1Kgbgukb3lEop24ztdnyO
	sK3i3aKz6yGaPhFd/t6qKD7HiwsZqYjd2ZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9sw4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 08:27:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so698327a91.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 00:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953645; x=1794558445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
        b=Mn1RsAREf9PsaEfr4TyMziuDz2Wi/R0/AcTsnla44K8g9Di+0yVWrU1yGrlf/jqABE
         dRyjAVdt56C/iVAlBO7X5Fmgn3OzdjyrWdrntZO0MvY8pc1+hd3Pjrd64HurTeNJOQbT
         Btbwzajy1GTQaBKq6WigiiIiY1l6z1AabuRVy5hQfzLOXdEL+O0fla8DV68E4RAs9Rfc
         dDsAFiEjypDz1nGyd4t87qafseq4PKcHIt+AQ01gmdUq1SHtxDzG3KndFpDDvPKiZN1L
         J+rRkvVdIuDLl4hO2koLX/5lQcEmmGaCvNvjyZo3R77ryHmfIHLhZFe9QNrO72gZVlHR
         w/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953645; x=1794558445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
        b=liroLhpVX9Z6lYmA2+/EvSbhDp46wviSYf6rrJwVC+ECQE5dqjHqZiKlpQymebfu5V
         nV2LAZBEjD0hCdC79cAUoWFu+ynq9b0dPtUMt0un5QtfuDluyXQA3YjOkafgdey089Ir
         BT9MifF49KOK6Dha0W3JCtuafQjmvjwxAiyL711Vpu9HVje2CSloB6gzGryQzUfLM7I9
         KrLkFVx+w4wETrvuknbZW8WSeHoCPsp8lL/vfL74WWIoCb3ohhwkV/yq7CiCq7BH3BYn
         kscO4410PHKYD+3qKKhNcY8b/Lvt0qCj3PbP16t2sM7pnkChKtskMrs9B8bnHu2DKTS0
         0/ew==
X-Forwarded-Encrypted: i=1; AL+hErEWFqu2hkO0IwBzose4XW0RIVtCdVX03VHZqA4xN4F5GOCRU1JmaH2hIU+s3ccWPYXRGEdklR7AQy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JUxPA6usuOFubMG8ZYjdVCXv2HiM+EeyxA8CLw29GA3O5jI52
	cY6ZRan3tVV/CyaV3LU0TT8D1yiqlOnv/IttYNUNIv34zfP+MnHuzpCTJVOAs+VAm+R3wcSJhdi
	dM7+f6a0At9zuh54ZV5rzH9wppNhiRxe8Rp3y6Cwo5OWNHkEB7ysTUI0h4BQpzhY=
X-Gm-Gg: AYBFou1fPGgBq0UCgCv1fDQ7FBWlVLaGhlTnRsqVhDKjDbaMuxYgDqXnuYDS17cvlwg
	m84GJqkjQTh6FyIo++ppWJVsI1zFk5qE0lQ3KG871GzeWhMQrAFlp9yrTppJJm2Xxcx1r9gHPJ4
	UT1goKk0dmxXtg4FNigSOjdHChcCtc7KbMGNfos1PNV0KcYIc/WWIGcEs7whtJVv4HTY8hRwGF5
	7PrfgnXmq4P01Pe7H6LaVX6vinmwzh2xCfZmytI06QMQ9WIeo2hy4kYfSg2FPrJ/xGWIUeEBlXd
	mf6DGdwItGVVippFb1teeRuHPSs82x8XSilgaq1n7NRjOS19ydhKadRilYF36IUWSgOI3vdCo9p
	GMGHBSJuOvgoL7epM7ghMDtCqs/JI3rtz0hxHYW0wbfsR60UJ2XUWx6q6F02r81CQ75yfwO4hul
	qOyA==
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr1738381a91.25.1793953644456;
        Fri, 06 Nov 2026 00:27:24 -0800 (PST)
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr1738351a91.25.1793953643921;
        Fri, 06 Nov 2026 00:27:23 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:23 -0800 (PST)
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
Subject: [PATCH 0/3] phy: qcom: carry live SS-link state without growing enum phy_mode
Date: Fri,  6 Nov 2026 13:57:13 +0530
Message-ID: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX4aXkywdW2R/e
 sLuolPu19cpRXcfxVCU0E9L+7W+wqnQXQlBreOe84VYSqBiqmU8y0CrVQjyU+mJ+kz7knioAJZf
 lLW8U9XHlodVmc5LVlr97C0grACGe6Y=
X-Proofpoint-GUID: BvhPq9J4FKXKbORRQPbUCg5qJh9_ueT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX4DCqLSecowcy
 tTKtJbmvceqyK/nOYDzcv4Twg0r5OElnu4VMLh8N7nxrG21Tldva1cFSxbJWLqmq4zbZPBiZSMM
 haqUirXxGkHTCXeQJzXnR+V67iaDZj/7Zcq8OkufDs1PUhMHQdySrq0BaUdPRjtI5bMsWIB8WlT
 ZPRNORFHdJf9kL3xZbPLHtgNiGRfMQbgFBDIm6w2YPTOQBcXwlZyqyd6tlWKsM2RtfXn+P+lusn
 bfQMA7cwUKCfLuri636D/DHcCzc+dZqBO7SLho9jGyCNlVAVF5fK5CwjDQPF1ECnbGHZNm3mmB5
 ZPwhqUeA05pm2lI8nPS3ZTqa6nWT7aIECmmczlFyvvz+sLUApc5ZxpFCgYmWaQvHVxO3877tEgy
 te5TgALmmXfMPKvLeUv4WaSEaE3WjNV1ZMIuWYpB/icooGvaxiBOwqC04jRvKnhw342zF9EtQyo
 EPLAWFXw+1PwnTnL/Hw==
X-Proofpoint-ORIG-GUID: BvhPq9J4FKXKbORRQPbUCg5qJh9_ueT5
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed8f6d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=rQF6O0ERi8bj5yKtaRIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
when a SuperSpeed link is present; otherwise they fall back to
receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
made by comparing phy_mode against
PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
calls phy_set_mode()/phy_set_mode_ext() with the base
PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
submodes. As a result, the comparison is always false and the PHY
always falls back to ARCVR_DTCT_EVENT_SEL, the legacy USB2
receiver-detect path, regardless of actual link state.

Add a dedicated qcom_usb_ss_state submode and carry it through the
generic submode argument phy_set_mode_ext() already defines for this
purpose, instead of adding more values to the already-overloaded
phy_mode USB host/device submode list.

Patch 1 adds the shared enum qcom_usb_ss_state (UNKNOWN/PRESENT/
ABSENT) as the submode contract. Patch 2 makes
phy-qcom-qmp-combo.c switch on it instead of on phy_mode. Patch 3
makes dwc3-qcom.c sample live SuperSpeed child-device presence at
suspend entry and pass it down.

The contract is intentionally generic so phy-qcom-qmp-usb.c can adopt
it the same way for the gadget-side case in a follow-up series,
without a second mechanism.

Tested on an x1e80100 CRD. On a host port with a SuperSpeed hub
attached, suspended the system and then connected a SuperSpeed USB
pendrive to the hub; confirmed ALFPS_DTCT_EN is set instead of the
legacy ARCVR_DTCT_EVENT_SEL mask. Repeated the same sequence on the
USB-OTG capable port with the same result. As a cross-check, repeated
both suspend scenarios with a High-Speed-only pendrive attached, and
again with nothing attached, and confirmed the PHY falls back to
ARCVR_DTCT_EVENT_SEL in both cases, as expected when no SuperSpeed
device is present.

This series spans both the generic PHY framework tree and the USB/DWC3
tree: patch 1 adds a new header, patch 2 depends on patch 1 and touches
drivers/phy/qualcomm/, patch 3 depends on patches 1-2 and touches
drivers/usb/dwc3/. All three should be merged in order and ideally
through the same tree (or with an immutable branch) to avoid a window
where dwc3-qcom.c references a submode phy-qcom-qmp-combo.c doesn't
yet switch on. ARM/QUALCOMM MAILING LIST (linux-arm-msm@vger.kernel.org)
is Cc'd on all three patches since it covers both directories.

Tapas Rana (3):
  phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
  phy: qcom: qmp-combo: Select LFPS detect only when SS link is
    confirmed present
  usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 +++++++++++++++--
 drivers/usb/dwc3/dwc3-qcom.c              | 36 ++++++++++++++++++++++-
 include/linux/phy/phy-qcom-qmp-usb-ss.h   | 17 +++++++++++
 3 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h

-- 
2.43.0

