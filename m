Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885710;
	b=yjkmqGJkjAfSz5ExT3/f+ZatbK0d1vYmVWbaG1mqBl/gYzq16IyVmWoVKffaMfEPZLOa
	 b+LZrVDVpm1MS3wkYa9LQW4DS20qKDpNxNV3PnyByRQbk8Dyp3ej8vd1IP935WSzKsEkG
	 3syVUIAglHR+Ru1J3uFo9CJNJx++bO5YdaKg6sqB3w4fLyC0rZGnKK2AzBnCHZ9k5g7b2
	 DuBOITBHiKAzp0Wp88POmmhQwopGxSBS3rRbioz+FSMrxTIVX/EYAJgYFS3lwxy6jzPOL
	 lemW07BdG03MxUh3amygVVrZMBfo+Pj7a94YYXZhv1WGM40/cI3hGyaIN/kiwagNfTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
	b=QMRin3ynZ35B8ZvHoYsY+owzfMrqorTGcTAtFUYuvtebKb0ObmsjLL/tFnuCkSyMJqjm
	 ZXHf3jBJgGursIeZm5lxpx7DK1AsxHPUssgbusdtK5FEu2Gqx/2ydwyHwjoCwK4w7yN+v
	 CLrxhw2ZrfYmX5cvJbABdMdCnO/4nYd2FVgoCz7EP0kPyXadV9zkhF3fInwbJd/rruVXb
	 TzYVV0HuWVqlIYWds9CYF79ihberkCwzrSbVbUxrA+2T4EtXnkTjR1tkRkosuax7+haUW
	 TJgmS1XTmQT6/5DbC84Rz0ZsZFoPAI7rpQgnsVZGXf3IvzUKZ1ZaskLemxh6DgsGAJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sff8DYwC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E823606A328
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 13:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E823606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sff8DYwC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ai3CE1583132
	for <linux-usb@vger.kernel.org>; Thu, 5 Nov 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C6les2P6C3VYvsc8kD6y8hS8
	7HftniHxNnR9mHrsnsE=; b=fzfhnCGS61R5KeLTKzhUcDeAl/a29wFH1O5NR8ZL
	Iw6z2btcm6+JaEDnK9eSRH8JWClTBhbiW1AFYg/luuhSwwunNo2lkKeM8EYe8rvZ
	TV7x7CaQX3OrmcH16RuJqyNZaCGDINouoX1PTlszEStB77ayp7XVqjs4moIZ4Xso
	E6/GKvXrqnzlh6tuy2aaE4RkQ/asZV+KBiDYP4qK9qy4XiIAloPmt7N3Uj5FTN0f
	HCbfzWU/oCCQ7Jmpz8VKhvc9YoBR8esCIXqkfvzL9IGE8Mvw/QTBa0j286UPKh9Y
	aM/5s7PwOIzIj6WL90/6ma44jvKpdaijgodIthb/ysITBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarpuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 13:35:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so384941485a.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885708; x=1794490508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=Sff8DYwCXaZESHDiWF/DLcsetFFHsRTXHO++rGe2bQH3aAzGd/mMmU6E1g3KwYiqTm
         GXWfnoB+DaoQW+v5QYiI7hCgKkpCzOZBaT3mq+7rLFZj5ljiRgGpuFM3bj87xOckKt+S
         o1wpar/lkJRRpcOfTHwi3R3CWrUE06ylpytjBBcn4cEhLRF6QuMLQ56vDWA5PeL7oS4o
         /GUfYoNGB0yxN8qUtSh/TMH9rDHWDRTMIOqni2VQ06leZN5mn2CTryO9TyZ/XdrzCrqL
         AOK6qcKNKgURH4ARn269kP/RZwBS7FACAW9PmNmwAzI4ObqR3miNdEKupjM+zxBKKlYI
         BnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885708; x=1794490508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=lnmr5IBmUM3rtpa0rsWX4GHhjpAXoiGUNE3Nry+ph1/M7D7KiXFH0MukvXsJR5LoeP
         CffCh45mEqrsmuCOlarRFnX0s3gFdDs/2lfdfiOYjDhU5TmE8gatvBpuENrYKgCmy+vb
         17WOjDeajvYJoms4GQV/k63xKqKOCX+3gc8pmHpcjY4yicXzLsZ4/nVWNyPAxk+we7/z
         AC91VsSu4cLPMrOhrxIgQ8+WNvWFqyTrQK/CDG9ejJywWrXKnjnmrtXDkAmEmvjs4kg4
         4PI3awOl7qCfR/RfT+DRPexaY1E2IgeWEx/88K91OAOeeeiFYHJMyWzp6CjXa4ZWynUd
         Fcgw==
X-Forwarded-Encrypted: i=1; AKwUvBz12+n7wh0bO970XtPZQfWeiTfhy+6on52c+tl3kPYwWoEOlBiI64OpjwbyQC1yy4x7voYAi/7NtSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/nh5Ag53oKoqFM4yi42qEhjc2jOXWrjsZaetf2Jf2o9M77Qol
	+HVh0EouQ/bONPPvZaE61AI65v0q5rH5s29FECBeKlg79e6d+yqqCso3ZzVI7/gklnblc9XSlyx
	Ir/bNw2S9iW2TyTHWfJ6DQaN3/5uY9mlQZiKx7mSJ21Tsks7HZKm6hmOey0th74U=
X-Gm-Gg: AYBFou0cq+3tq8klyZKb6ENFvAQ5zlNmHwwzNs/Q7hFa52kDyJUXgtJZLoJ/ZVxPRdT
	qTFv1H8UeB/PJGBqrFaVQWQxnHNbqTCgjw2kenLcBpgezxVfAOWl5ZjBH6+UQ7XxGZrgPju869z
	F5oXFC+fMG1zUNDO0/lc0WtW/Iv40lapQYiWNj/owUFH+YiMbE1zgJGlLU9bbOfhNOBDHdqgZmM
	y5gGBW1Gj2U71STMn2XSrYxENEh0cEM5U/mElW9If4vXkuzdpnXIMtINKwUZp43CdpnExtxox+s
	S/NUeTTkZVunK8jgGQu6ra4WyKw0WtwxDO5DfcepVkPSDzW1xC51HPQ+PCxqsEx5hpEL7ToLWaR
	Bvwj6YPUi/v8c8mZuRF1i9cm42D7CBLai0+m0o53zoMjYuy4/v2sBm5S4iIgZQkdhimhV4JSsu2
	JXHqm5RWscYp08r3bBkTvzitGhGdkPePZxx3Lu3vDPH0wOlHEGipdDaX6uMn5a
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578453085a.20.1793885707738;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578445985a.20.1793885707078;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e07fdsm10695471fa.28.2026.11.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:35:05 -0800 (PST)
Date: Thu, 5 Nov 2026 15:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Message-ID: <6x7dtyvhbk22ri6nnpuo5jpk2ijphaebgbbchoramc4fhnvgjl@slhivetxacte>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
 <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfXxCSOtVOcb5qc
 3GuOZ5kVjxTMVR0kAyRPn1m1VHyoNFdqcHqPfE40+MTR2MTASDJDiwUSWNDW4mLPYUOf6KBSBnK
 ReetHP1NusgiZtmIDpit3uCKosm7SO0=
X-Proofpoint-ORIG-GUID: 066mqqoXgo5q2KD1Rsh4Agp10Bsvioqg
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec860d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=oSBH3dYeosbuySqTTykA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX9an0wjXG7EGR
 OYfLG9ePlzhoqtkCyJJ8DKSt4bpSaD3A0NgGIKcXmMtMy7McwZr6+PEpH/Rz2SljiaoIJD0ZtXj
 2AIzX2/n07mT53YD0k92DAj3Wr2kam4HNbVRkda/4gHkL/Dxfsj9qG3q2Ke5FGI0yk7VGXxMrCN
 LSF7XO5Mws4TWBuBzXK2qIb7OwDvxQbdf/I5mzxq77Lwq8nZEG/0V8UQme/DwjQkhSCiuFi8PSD
 xlOHDk++nOLfNYAptb61y/un4ECM6G0VgT+xLFzujS7Nh/k1GozlrnXPGUR8TjXtJIYFj9EgTcB
 Xd8QDqcE1ojqXgyjAOuAPHs58fIkNRhs5SWfCYbXVKobhwvU9hdMD8kMoxy5D2gnqUN9aoJvqgR
 IHjhh7+DDV6GIF2LPtFnoJBwbewsVzcor2ATUAADTSAu9hwXOx+P6n89IITv+Ev5WRxaEVhHP3H
 vDDK5uFY/6exVliy3KA==
X-Proofpoint-GUID: 066mqqoXgo5q2KD1Rsh4Agp10Bsvioqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054

On Thu, Nov 05, 2026 at 12:47:24PM +0100, Luca Ceresoli wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> >
> > Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> > events to the DisplayPort drivers.
> >
> > The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> > preventing extra cross-tree merges. It will be removed once all
> > drivers are converted. The drm_bridge_hpd_notify() function is kept for
> > the drivers which only care about the connector status and will always
> > pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
> 
> Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
> _extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
> drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

I'd say, only if they require the extra status. Otherwise, it's just a
noise which is perfectly handled by the wrapper.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
With best wishes
Dmitry
