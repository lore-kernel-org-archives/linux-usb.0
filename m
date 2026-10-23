Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762806;
	b=mU4aV2kYsIM6gYyLF4naiyQVr+qmOYyOzWVxYg2wFglgQzs+CCZpYkn8ng3ye74r3jLR
	 NtKacVI09ZSFeUpex5GhqvUJn4nLuvihNidx9J1n4XVf19vssAj5JZBTOKtli7rT6F6Sq
	 alwIeZ9PoCEcQ1x1JJl+hcQhB1hcE4QjcDZF27zxtleuDAGWr9ZOQWnMeb3tualFHXguj
	 X2bkdtJO7Tt1wCVqzqrajsT/TQ+nj+iWpsH1yI6hHw2E2dzljyFU+0zltGA2Pf6AuMKuf
	 28X1+yGg5oyUZYJtWc3hiv6KhWThy06i2OM6UVTaWMktvE0T+xR52C2NVc4oosBpl0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
	b=sAGIuk7eYkiPAbyOMmVEoOi/Lp8d8hsyI2/oCRFYUclumRYV4fCh/0F+75QJPZvg1zO5
	 5DjTiPC/ImCy9qZyUaemGxB9EcS91/h8RGZ4X6URnQX5h+jywyaPEN/XfzfnAZaOeNG/1
	 P2la4MmoiQzDKHo59zJogKEbm8XinUlN06v2Gk/zY5NXCCk2tGORUYmS2dTLSgVXwEwHx
	 wdUrTo2dk0byds8jp+Xi8IAs/fcd6JZqqWkfGns+8N9twfQNJzPaJJrTUe9mQpfOqP/fz
	 p2FbJoq7HEX8vh1e2U8/Z/txW6Z71dYm2XIrrLZM5MV9mC+wgjj1pBrXhPP+v9brVow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TxMJRzQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ys2NstjC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB330606A330
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB330606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TxMJRzQF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ys2NstjC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAFBB1597380
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OZyxso0AaOeFf5p2y8usJ5
	/jhDO/hkU7VHpqvGOj+GY=; b=TxMJRzQFENnrmyB7Yhrx6phI9seAwH/ZWkk/zL
	m3JhXHMBTBuHKWQCFqQ1XwuYZPl/aa8Y+DUfshW5F/4x6zs81QYipC47HPnOnLro
	+k1/Usl1eM7AqiOajLBIzdK6PL1yEOg/TAcxkJd/CW/+Ub4zmjwdi1ILDInOtAfy
	OZ4e5aN/sDqO2nBuwNNQaHXFUfteZa+gentyUGltaWOQ72I2KFYQyrgfWxk+JiSI
	QVNhMYXo73yJJfX5wxQL8Hro7y8/algrrlMcC+18zijhH+Rl5djaRYzvLGX52Ct0
	bDjrYmKbjPE6QyfFNym9APk/WWS6M1jns74rWqd00WDqWJIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b7e90fef1so39742566d6.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762804; x=1793367604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
        b=Ys2NstjCY00iumdWJBkgIS6iUUMEdsDdSwaYPoGNna7yKU8KX56B9w/iAhCWB/FQDV
         +d0QFEDt8fjiiCs1pHHZglEhrw5mVoCTS3/EsombLD/jAKtck7AkBHTEkdDUMaTuXhbC
         UzL07+co9SjwIIieJJB9RGl9qzsnGEyYHW1SWi1LdXNOBnCzVYp29J8KftWAODTcMfuv
         unfjki8rFFFJ55PeH416WUMZMgm641txbMDCL4y7htr0q8QW02pHSglhZGuYsiLpOpys
         tofIKpC681slY+vRcZgM9NZjqM2iOAhulZLogWN9/kMt6IJaMGpQ1WlkgeohGO4aeiWU
         E/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762804; x=1793367604;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
        b=ENH3qF5f717AyyO41p/sgCRcF2WPNKkheRJtWOVuc98SwLPS8iXXOQgWVRkxBwfpXm
         9rpmcRwXDASaRPRqtO/Lh2S/UCOcENFP+R29MRVzYg76vlPWzBkULXLwJ5RWmwKt1lfN
         fFe3NNhgtziJTGbnNdlNq32N/22X7HVvj43tpilwWpTNXVdMZ5JTkYiz3Wa2QBHXVeBJ
         LWND3DBXYqNa8E854nf5qAflBh7jJJEjvA60UEy/s4W830Y0JhtDJhF3t3Iyu1KfnWPU
         bo2/+NxjYxVI1jxfgMlSHLbK6j85WmjqHz4yKEYaxQLvPc0e+oCWhPXqgPtdjPiYJVFs
         fuFw==
X-Forwarded-Encrypted: i=1; AKwUvBwpcuolXrzzxqc4hg/lFefT4CY8iDpj+qGmxe9fxsDpjKixGktN6Ed4rEzrFZDDVndFGW4I+Xd6Iy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI//2ElsQPlbr0g2akV74uaxEZBV73/xtOdJFSJw+Jsb5A5tzjv
	MLRlZM4NNu5fPHqmUrkkx6QqRkuzFWPZ65VQhz+GNkR223L84JoSvMhkAegtTM3KX+Kp6lYdnud
	TdpClEuhlETi8hMzlJ6oOARSJyMZoU21AQa1A7XIR/tZ+NNEYiqUh+Xz5XXFYVvM=
X-Gm-Gg: AYBFou1dAnG7FpBuYjC9PcTI8APCmfbQmOEOZDBf1hvtiurtjikkezPeHMkFpqEcIaZ
	qWcGPySGw0zzj0u8EpooC8Aj3L1fhkIWkYNNQfAIP2wpA4GokR96fE481Eivcbmiqvql0NKtYaO
	j0+cda81nc8yttIhZobpblpdm3tbCsKmrOoqJvt2KEswUFlWT5rQEHcjQUXYZSnymi3TvT3nycv
	LV1WpPGuhaWw9BUHTeb3P/QeP2EznBZgYfjMh5cwLKr+N9Yzb/b89oPHz34SKmcQShw4CmYryX5
	sz85FImQnwWt+XqRDT+WeGM22+jBx9wf1FNVewn0T1G0SbWQ0WMjXqZdxh9IWq0mapCG5ztN6fA
	AZZTQCxEoyzOP1iq5a5jLv5uK/hIRisz93GuZ8R/GPAQZflY6/sDDhRw3bT4m6H5jbd5bB/WLl9
	w6LpL2GU2jTBLq
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr860056185a.0.1792762803642;
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr860049585a.0.1792762803079;
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/9] drm: handle IRQ_HPD events correctly
Date: Fri, 23 Oct 2026 16:39:40 +0300
Message-Id: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJxj22oC/3XPTU7DMBAF4KtUXuNqPHbspivugVj4Z0yMaNLGa
 QSqcnecImhFmo2lJ42/eXNhmfpEme03F9bTmHLq2hLM04b5xrZvxFMomSGgBiUUb46Bp/7EaaR
 2yJwMOg9G2yoKVj4de4rp8wq+vP7kfHbv5IdZmSealIeu/7puHMU894vr//goOHBhnYjCR4cOn
 7uct6ez/fDd4bAtD5t3jHinICwULIoCjJHQUE31iiLvFbFQ5KyogC4qCNGvdVE3RcNuoaiiSHA
 anZSV2pkVpbop9YOLqqLEKAIB1ODNWhf9pwhAXCh67iINWRmCtfqRMk3TN7jY0hAjAgAA
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
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
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=niEm2MZMIIMV2XZngvo1nnwS1Exvi2T37RRlW6xT5ZE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bt5AU+fHH6Z+aKiHw/fPhrrVuZv3Nrj73RuuoW2e8Hl
 i6cz/ipk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+feDg6HjmNvhRUqsHt/l
 YgTX7Pd8kHr2/UfNWSnBPi1qa2OjlYVu57+3u180Mb3raryN7eM0nxMN1zuPHhHbpZax+l4+n4F
 i5MSo92+XH9ve452iUqPdm704Ryz+ds6dPfNUgqRkqiM9eiQT4u517zfeolTyoPAW64p79d8UDI
 LEPKqTOmKefptmHvFLyie6rvgxY9CNK8yh6032erD9u9P10dZB0sGH20eELXt5Y6/xu7dML7ytf
 GdO1D4lqOtvLijIXdCd9X5B7fkDPZGbl+6b39D7/H5+VoGG16N9vHnHuoSSJxyUt7EIiUmau7H7
 yONXt2dEeIhIT16V+r2u4l1Lw5OpLk+nXH4lOLs/9K4BAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXyT9DQu21RQLG
 GsZ5/efcqu2GnH/R9l4G+YX3ItLRIbMQqZKBnw/+ju0Vhc6ixEYdBieSB1/NhA9VAt3zIwOiWJE
 2QRN2D/eKDBa4F4vFhdpLg2x16v+s2TCfsW9+difdAjSxSB7OI5f0uOwCmftwpoN9Z5sva+zdby
 kmUZzcFBxIfAoJIMsZl/pFr4r1v/iMBVndUN0rSkwaXBAOEOZUSiVkI/0OHiFOD+/farE70yBgb
 Po/giRuxskKXIh9824XGHOmzsuhyVGrkdmR42TLWrVRzWX3nCq0MbRJcldwBZ60ILg0Vf+kCS6l
 8yX/Tj4rzTxWaxZQ0/jZRrzBip19vKk14sWtffNPszm3Oi9Uh27isRUUO17IfVbnipblo1qER5p
 DRr5AmMld3IZnguCqvWRsh9ffMJV1E8jz2h8X6Dw7H+hxmAvVeuPcrW1wj/D8w3tTkBvGHxxQY8
 CGsCQ/cC63EbW4esiCg==
X-Proofpoint-GUID: tdPSYZ75YPAzJ2Gkr8R-TibPKpDXTBDi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXzr63HoLLpC2l
 Gn5zMMVHOKEsi/avVcn8MitMrEMzq4usgUrG5pZCFgmWr59xy+VFHlXxEThYCSRhps5KCHc38OU
 h4tYawUThOJE3L4RAZXJPGk9aTmgpAI=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=uf6nnPeBmoxfmv3DkCAA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=3gWm3jAn84ENXaBijsEo:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: tdPSYZ75YPAzJ2Gkr8R-TibPKpDXTBDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Fix build error in drm/msm/dp, forgot to squash a patch
- Link to v6: https://patch.msgid.link/20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com

Changes in v6:
- Corrected indentation of args after the function rename (Chaoyi Chen)
- Reordered / rehashed patches to be more logical (Chaoyi Chen)
- Fixed build error in the OMAPDSS HDMI driver (Sashiko)
- Fixed IRQ_HPD vs PLUG interaction in drm/msm/dp (Sashiko)
- Link to v5: https://patch.msgid.link/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com

Changes in v5:
- Renamed drm_connector_status_extra to drm_connector_dp_event (Maxime)
- Link to v4: https://patch.msgid.link/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (9):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm/dp: don't take extra references on multiple plug events
      drm/msm/dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 12 +++++++---
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 25 +++++++++++++--------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 20 files changed, 158 insertions(+), 66 deletions(-)
---
base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry

