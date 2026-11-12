Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451221;
	b=bGuGAvV/+OjeaVO3P9tcyre66THDxbGdJvoB5cRmj8AkFd0QECCmYtoYPvHtTvIohJmZ
	 nLI2aKG5z/8XdmIjimBFAC5jnKltNmLSMZVIjOGeMA11Hrmwiwr91JsxzwpXesXc/e2fe
	 4ts8F+sZV/eAA3SGWbGNsc/gJaUhC0PulWvffXQ8Q9d8nzJrPHN2m+vyLVSNqYxKRgwET
	 0/dLwctD93Dd3dLzxFMYjExKwG3GNib11BKNstd1TOOCDTMBpV52gJZVfCIO/r9hIbi38
	 A1LyQJMDHKu59/4eDObP4NjbGubqwvCVPVa7kxFKAPEMXb82QX/SnYZ63dkUIED+hxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
	b=Lns/2BDQNspaZWgRn2j2obnl5jpRswysyQGIM2J5MC+5D7gdlOIB21oafMFCu8EnIDs4
	 aw1OyNKu5WYe3cqhryvbhjsfZGklf0Usb4N33uO8ReNO0GfzZVqdc/2NEVsPvR0RJSRSh
	 gtqxs1C/cJvEbr7BhbeASir6klTn8Hx6tMsPhGSzS9ZQPG97r6e1GLeIm20EGZDNYraLf
	 q+KKmQamn6NkX9KHBDbQT/AjymhJ/9YV1fhKm4QoIa7K7r3ZqbGhZKguQX69ZMVojP6V+
	 V/Zcg5OZonqCoeonuW09QFnqP4lbeuNoWfmIgAJ2LWRyAR5++XcCnZaFlcmyzP/5bcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KI/qRF06";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSq0EZqk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B0C606A326
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 02:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B0C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KI/qRF06;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSq0EZqk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZbIc2514242
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 02:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=; b=KI/qRF060qDr0r2Y
	cJuOgXtsBpuDssWcFJlKOO1nnz751BpTeh9oz1oPGvjmslvWwhtLwO06nYw9Mz4r
	ecj4zy4uuMABNaIYsfdpdtFlcLHOb0GPfLodjZXjXNDK8Vf+XQwfP+fvVcSjA1fG
	8h4TorsRex4rX7DoDD7Xb8uxUGXLLNcE7DByWRDzOUXxuwCBoKiBaRMH9GFL3BUA
	/SVMy9oqTiO0QrtV7oovqEHmjChkcnZA0sdNFtNSTh5HzTW33BNQPX4QbldT90Az
	F5ZYYFXjKa2Gozlp/vRRIx8hfdaKFek54kf3AKzEgLxcExHQcVbuPbqhhr1obTxj
	daAuAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1sj0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 02:40:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-534f3fe0236so81270741cf.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 18:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794451219; x=1795056019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=PSq0EZqkBLcGccJMP0Me92Gp8iVJUiNrGW1URGYwVQkSEO+8t16etkBmCF1Auc4EwF
         YssLWxP3eKCL8FkcxTSWNTKnKttaxU6KnrEwtxMcI8nnHBWgYnifoE7kzjS1AeSlZR0e
         dOF7gqqesq7OgqDUS1XUsMYJZE54xQZ4l5BgVdJss8DcLcSyCFw+evV3Xh5TFHXrLw7R
         oproPtHZKDjFiwjGtYUmJmFFQaNbj22Sd9GJORn3ftdG6k3+mipnTT83mqiJB9CBNrav
         rxNM+n2AUUwKD5C8j8ssJlHPB9zRbmnyFEc00en73rp8p1yV2S3AcrPqaLiNxvVNXqPb
         5Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451219; x=1795056019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=s8oO3YJBfzd9g+HSR9vwxngnKwq7j1lwBGm8G4ShnrpAGdqBi9q9eVOoeYh9hRy9YI
         aYoBSmaoe4DJnROIaett0c7WZ1EuLrvZmARvsZ7SjiaBXIUoVnqac3IfTB4EniZpTMA1
         IMFMn20jynCCZCgfpD1Z5gGPHpHs8MEjDe/LlK+1cct43RsOWHMt2kYe/HUfC/rcl2L6
         jZBJyDLGkeAMp/CkknSz4ZHeME9q54rdeRondPSV9mZvXcmL/IxIoSCMTZWA/uzFNg2Z
         5EUDXU/GqEARkLiekGDGiAIcHZEjU3Qldi/upMIMHOgfnOBPL23fP6Wd94SWyKR2AZr7
         gOGA==
X-Forwarded-Encrypted: i=1; AL+hErE4YcjEuz5L6J/qJoPRmaoYEVsRmhinQNkLahpXqS6kn2gCFr/A58PUQQg2PdbCUHmaU3hmVAI60VA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tu6U9xHwF4/isxWUIK1KzkClxBA256WHiPxe8oKrs1IcxfLKm
	oSBpXnqJmFw9BsNMXHAWwD2EqsFIFTPtjsg4SoyFkXtDiJDbRatLpqG6DIj2InI3BoJYxQpY/zQ
	L14/Dieu2OtqnHiW2CIIWkm3TJGc2txya9wiUwoLhBLqL/2Bu8dDJuiq3I+kCyNI=
X-Gm-Gg: AYBFou2LZfovzEeg2pv/ZFerAQfdk2laKOSTXcqKAmYJChuhjoyfSUoFZEy0bA8RVRY
	x70R0k6ldGfklC4YV9yFG95IZcdI2nLcthLsEFmr/kJ1au+83AI9aMc/StIk7uEBk0S3jzc+jHX
	xOkR/yz9Hz/uJGgtjlXN0IfB954q+yedbfDeKjaqdEuPKyeBnrna1KrItnDrSFn0GNJXHRhww/P
	M4ZDT9cJsaTyHkg2w2ZdR59h2EjgrOSIHEu1MU7nhPWvx9HEmf9KEICGXAjxbVCUtQqkdu5UMCT
	Ok3ClviVVO6G6qNPFhRZA+oIo2NEKz8god1FSLe1Jclfa8Nl2ZawGFHeD1YUDs3OU63v345mlcE
	DBRurd1p63Gjla0XK98TUVYlfyMIeXZQTbLw87Rp5/pIudDJ64qn/hF7anlzCNN9E/i3XLmNzBC
	0cd2Wjx3y/esrtMGbfK4pQXya+qRr9sOLFYJNZEvM=
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64865901cf.65.1794451219022;
        Wed, 11 Nov 2026 18:40:19 -0800 (PST)
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64861391cf.65.1794451209677;
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bd33340sm64426881cf.21.2026.11.11.18.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Message-ID: <ffe9dd90-909c-4259-8a57-2ea67307a95b@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:39:56 +0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Kevin Hilman
 <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af52714 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UkfVDg3vQ6na--iosyQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uNoaEyM9MCf4cnTHepN45nBHBvT4jIbx
X-Proofpoint-ORIG-GUID: uNoaEyM9MCf4cnTHepN45nBHBvT4jIbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfXxAAogx7AgaFs
 h1HEneiNAeYAsxQ07/QaJZ93qxvIDbdgHgWW+PyohLurUK38T2DD3SqTsrtI392PDbqfsQfdKcP
 Ygei/JWOwPOf6QQCP/7fk9oUG/wEcnJEpzq0tBRBQOjb4kL3I3lpgQJYswLkWm5oy+TskRkMSV1
 yOimGYoXGuVFBsQnLeInXcDepD+L3PIwTJT3tzlb8EmKM5VHm5pGT5AsDC9awqlzQ3X2+/gco03
 zjYl6iPcjNVT+mcAVYNxcUogbsPDONwm4CPaON3rdpMBRRvw0Dwhc7IDvRb1M5DigsJGhe15NpV
 7tY0zCeXcq11aLl9Rm4hFijsbE0qCeZHy/uMREx2mLwuRknO6hterDcA8HOfX/5Euchxp+oBfOR
 FBPWi7DieL1bv3dWPPVA88Nhko09m+N/0mdnn8DYDCG5/qAIPuezuU9Rq33XS7hB9OGVMOezI4o
 FuUwI/GNSFyOryDVxtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX4fk0ENC2At9o
 nQCBzFqdwqRO5P6nxCcYoi9aeKhpPzlY57y7qvlpF8B2R9xfYVrVxkBMemwUS/VrfVTNniiIMXT
 3tBnABCUrCnR5qWYj929mzLe1yB2L7g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120010



On 10/24/2026 8:35 AM, Dmitry Baryshkov wrote:
> The upper layers might signal multiple sequential HPD plug events. Don't
> take extra references and skip all further HPD plug events until we
> receive the unplug event.
> 
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fa8942922b53..ce919a26fba2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>   
>   	guard(mutex)(&dp->plugged_lock);
>   
> +	if (dp->plugged)
> +		return 0;
> +
>   	ret = pm_runtime_resume_and_get(&pdev->dev);
>   	if (ret) {
>   		DRM_ERROR("failed to pm_runtime_resume\n");
> 
Hi, the issue reported by the AI is real. There is a regression in the 
SST case: when .detect() runs first, it sets plugged to true. As a 
result, when msm_dp_hpd_plug_handle() is called, 
msm_dp_display_process_hpd_high() is skipped, which causes the 
subsequent failure.

I tried removing the plugged update from .detect(), and that fixes the 
SST issue. The display works now. However, there is still an 
intermittent issue where the wrong resolution is selected. I suspect 
this is related to the timing of the EDID read: when fbcon comes up, the 
correct EDID may not be available immediately.
