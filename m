Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762829;
	b=ZdWL/djVBquiJ/7psYb8i8cyr2fjYkq8xeb1+kPpxSAvrtU1ET89I1/ym1wVovSY8JiR
	 Dt9t1W1jwqGvvukddNBMlJ4JMlQSOSBDg/xaIsA7gwpQMxk4xyjEaVXf5G23ZAuA+VOU8
	 3SeZiTk94fPMUR5fs2QmjWIRhTSXiGazWMlhLeMqCGArWhCCtOCVYTRrO5dUPoFvQWvjU
	 zDgBBvsvoqXsubHPD7FJPpeJdAnIBPGHffqbtHwtfYdZt7hg+23d5VUnXiDY6FC0cDSh0
	 HBOQh2ODT/36B2kTPa6n93eeaO2YQqK8FN6h85n8QYDYkETIT03aUqsqSFRkvmvV7KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
	b=33mYWLNOOrUJp23s3ukx3uTZnOP7RJUO5Wh60PzpUwfkLBAeDm45M6gM85LI3Sow/+AD
	 MUyFIRFaEuonZ5N6mjlesIvePb6lXBdNVS/dHQ9f6TxtY/LqHfhMjB/byzRREoiCOud2N
	 O/HPbEFdh4H+BfOeAQjByOTOl4IheP4Z3nPXMmvFWG0Oj3cA+Kf4Td9izonw+AdX73wAv
	 PAwODqYwcJlgf5zc6Tifl7i5C08SxvMGwS79YTyI9NRcn1pR2An2yjnuNp27akZMrMqSP
	 IN7ym1zL0uhOLmQ69DxmUZY8x2E2v3oX1xoNmEezRugDHldUhbQ8UHU+1hTELgm4cXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JMALdV9k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVCLCoOY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4D606A324
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B4D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JMALdV9k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVCLCoOY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUhS1948366
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=JMALdV9kc5ziw6Cr
	v1pelBRZuf+CmVaSaSKPbKYKN3oIzBylbQWTrGwg4c6O7Btl7djYMrK445UQYTy8
	YL8i7y6GVlg9i6OJgnIbUcV5GpW8nk5xNMMJIxq3JFXp4QzxmixsAMFQ9XVgbGwE
	WlPUBU+4XFDTstZZfa2D1njrVN08/PT2xRiptPLYfExvXjYMlD8au5WQJYy2kK9d
	IgkdRsLdxT1bs/0fyG+b+ziovRwYKI0a90SWVjPHSiUHmLEHVRn74eDKdjkxbDF8
	DY/ESO5q6pUgLSn5VcOmzHxhhRYmAGKMj3kMXri2DmIw610MR6TEGJ1XCITpgt9t
	i0NecA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtuwxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so178112985a.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762827; x=1793367627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=eVCLCoOYS2tShM2X6P9t/F/sEbI5leE/Ny4CSNFVx2//8t7AkImQ2WtRp5IN/7fd/5
         8Le7ax89HwTErbvrtVpgg1cvc2nZRaUrg3PU7phtkGlCPJnjmad5k/daLyca3zHp8GMl
         y9/FsTCcnqsouQpMr+HzhhDmrONFDCnvCKdkL4M9T+MPkbvrGG2OerzRxnVPd0U1CNde
         PyDq3tNs2VCP6aPD2gcIRQS6zKu4JSYytvjlUtNbUy5faLaAlwPSP8777l1FKGMoi8BL
         /TdkpY73n0CG0Ic/rDSLiyv1eR2kym1nbfIYY4pP2Ve0/5RKHJjkcn05AbHPWIarRAGr
         EaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762827; x=1793367627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=KzSARdDrc3No7Ma3IrMiD2/k6akePmFAKkCQGMQfUkhg2SScHl+hyxQNLJgjTXvOUn
         QTNj5+0VPkLiF35CZwffvpNLnNj8xaGQluwSu1P0KQc/oqfb74ABktSax5EkKLQcUG3w
         SGg7ODikNhB1Jw19nlFQxpzzTozH2pDh4opy6TXb4Q0UN89ucGZkguAyBsH29hoCpGuy
         epLUaODwDV2cUztKmSHfNvUeGf1Hzrc6eUOZrJV8rwy0C3SQyTEREZBN7HFTsxh5Ydek
         FKVn/0MXfCtCRxkusH0faI6Vnf3kskqpg+R1LcRflKfdjDfxCc+4W3M2tiNpjLgKht9t
         4uZQ==
X-Forwarded-Encrypted: i=1; AKwUvByeBl2+8RGtmYI4H7uB9n2TuCk705A+YqJzwrv1gTIrohymdcfAlvK1ULO19tdN1QiaWo0nUda5Rxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfpOcAhzhFlBM+cslzJUuJLElx+ip5BgZnzhgarsbQUYYB4mUz
	48A9we5ih8CYfRBH4Cz8P7PADA5wUpGKHn0yfD4vbWVk1FEWN8OTRmKRvarqUkKO0lN4cB1c4ui
	ZS20DsRAuptgW2ROYThDFmc5Hwf2/WWlZ7K14HGMyH15AB7P3Jm3yVix125r6Ti0=
X-Gm-Gg: AYBFou3W9VaQO5C2rGciWi/qegoyI3PNGFx1YB7VXh/u4HEUdtM0PXsaulmk/7SiSd4
	wu/QsNAUJkSwWO+fnULykDjrq39nNNNXDY832+g9uFF/tZg9mVeGKjdUckK8OL1ayFEthwLiHJn
	fg0TVPYMAL/bkXXD0VuDN8lenyM3kr1W7GS4RXIzXaUW7qkr2OAPZHaktndLTsewlI6ms7OnGy2
	K2FAbmkg/VwNycjd6a68sU5V27h8JU5BdlVFAGYb2buJvQhAapw6Hhr552bPkZKtFppyGhK39eb
	MWNdaCFSzCSCAr8ziFGzzx33ldvUAtqfkH1qNyhEfDbEOWvmDc5chO+voO3gJL9eYnIz5x/4+sI
	HeIZnVUuklQ3MUkpunx9Ong/mlpm6lfQaOEUlNpPupzNBdvOnPCV8T/Y4SzSg+JDbSVIaetjzzv
	BxgjcyINE90gVX
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id af79cd13be357-93f6f656ccemr406096285a.13.1792762826788;
        Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id af79cd13be357-93f6f656ccemr406089485a.13.1792762826136;
        Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:46 +0300
Subject: [PATCH v7 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
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
Message-Id: <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OqJOhixgIg9VA7IzyAGhBk6OzyCFXXMBbpS
 bq6XeHn7UCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqgAKCRCLPIo+Aiko
 1aCEB/wJ8fNt4uH886JgFUulIe0+m2ySGRzn3AiPyxGkRwEFYwZVhXVPrSSDHoMW3xC8CJGxMA6
 akzlQzOCMNnGmyfRVQv9VC3GYfTRdB5YcrzCxwLohO/6nK3VVONFWTC3xq0BuFYq2X9EtQkr4Cf
 ZULvB5WBskmMM3/ZGAShDmPFWGG7/klJ1gV4ogm6oGdvEmwJym12Q7UbD0MQ0GXc+xhOFWKF6yS
 62bTAq0+FVAk84ja4eSe2YqJ+Sa2fVijVHzaIBWlSehdvaxYUFhCXhPzO2rsODtqnDYQujolgve
 S/I0avJ4Q91feNdGGesDsgv2uP3Y0LhYqJ3peVj6mP/fqS4p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb63cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5p8zsmKAytY_Bq_0kVonE-4AGzEj4TGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX9GhunNleuZS5
 UFuCHOhnStvNYI7qhEpJGuBUXj3kxQP3vhcn3gDc4Lq3YeFOzZ6F3Ku6XQdeAz46mTq6wghtdYB
 OhiTSD2GfbiTP0e6zumi9TUDKqy19tHjy+ooMceTw0nPd5UjxdttSDFe9QAJ8cvz3tLATNhSYCD
 uUa6ywknPpgSrL7fuFIXnLGnxu8qSPW4jTfLaz8cHJAYkNdfcxhCvLT0MPbAH1eIZQyYtrD8jtx
 lYkGVEr3LjM/yEr9mOuYO7ZfLGZ8n1FAtUEXwrHat5UpJgXJFyzT4Lp6dqfbjKPsxt8kE7xXStV
 w9szX2f63F1qj7GCWwp2w3j2VirHaeCZfU5J5z9Fhpz3s7yn9Z5FpxGHRLk0nF9hUhG1bFbhK+M
 lZkpW0mjraBkVYysgPSOrC2sKVN5cKZE+gI3tf0W+Qv86tSez702WfdRii3XbxNzkayvmVVlLes
 aaUiE9kAX15gzct0UBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX0EFJlCQJO5QN
 Geig3mpCfOfhGdoVXZl91gADjIfdZKtbJJkabKGiIwpdBVpYlDpF1vX2JDMViZByBAizCOyNj/9
 jbKZeQ/uacNL/sgXDHcsw8CRW1eFR+0=
X-Proofpoint-ORIG-GUID: 5p8zsmKAytY_Bq_0kVonE-4AGzEj4TGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3

