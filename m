Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675694;
	b=heSx7sny9Ho109/LADf96xNFCSfbptfuQkWBcTZillktj9zCB0RXaVSYOVOjL0JJZBGC
	 dcyzYxFHiQVehi3/xDmf7J7K/T6m8SzKXx7Bfu54MMwdrg8thVEK2qdZ8eotYKUs2C0QH
	 P9rNWo5pMAne6UjtZUjReGDQTIMozV7aHZ3ov+QXUv7P/OujwK9xOXiliR3emYRFX8hde
	 U80whrZz5KkWamstoz8TcQTAF8mYHyHZg2CThi99/FY4qaHSRJsQZ3bOZmsZfFaZ4D2vu
	 AHpI2JZ2G6Z1L8PDKEUVF9khkScGZ9sa3Gj9KbNZmNQUohBkVhEJHa34epG97elQy0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NjKssOS5UH1EpHAkVpfFza2/uTDAmbwdRnncm193YRo=;
	b=eEj8dmoEk6ew9Zh1LEYcMPolXOJMKedH+6TNn3UVc7u++fNjgZpXf9fNhaaXLc1MoNKl
	 tSkbdXG+qIImOrBuBBpnPnFJEsh5CH6wjPWaJyAgUASfcyCyM+LorE6tDU+N0tcMvhjGn
	 ADm1HM9GpAUIDPhBFuk+As1fdZOtIXgIkFDv06+6Al1ZrCnBlmpySDKYgSCbdkKoSHAt2
	 KCM0dmOhl+6yjSsIg40X9tE95lYWDt6KO6EpiKnNm3UzBE9Fe9NpMGdhwtCvsXnwqtNOW
	 Gsdf5TColWAV4hMH5Qt4jB1BjI47+3QMt55c0EwhkYhvvpstNMOgO8GacB07dgcVhZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXLFJO3a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mx9Siuao;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB42606A31B
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXLFJO3a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mx9Siuao
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0HKu3428085
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NjKssOS5UH1EpHAkVpfFza
	2/uTDAmbwdRnncm193YRo=; b=aXLFJO3agnQGUNjgecN3woAVJc1RiIfW/Mx+aL
	zCh+zJi7xBBM81JUTKmtNB1nDm3O6QccgFY7MF+Dvzqu+lJHGJC1jAG8lmS2A9JW
	bj95n7+g3uRPAYkI9H9nikq4mVBh7mjA9t3Exqy9sezREmKfrW3t1QPm44f6/qLm
	pJua+piHirI+cFUe8ahOmcBKHoP3UMYydLVDoPCzhcXbfe1X+MNGjQWbjwae8F8v
	ZH7tqChgjw3ppyInw1xRMPQ6vhsw/apU0InG28+PjYZS8Yk8LcjCKh9/qa4nuMnR
	ymtLMTxO0ElBvDe4k0y+sTcAy7GukQSUqHKcYQgbZnH+j9rQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq2j2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so6367285a.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675692; x=1793280492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NjKssOS5UH1EpHAkVpfFza2/uTDAmbwdRnncm193YRo=;
        b=Mx9SiuaoD2hMlelR9nWODElDnost+nFeCuQ8aSSGlCjLq25q5Pl58gk4V+cBjgHke2
         Wv9L9O9hhyXgNercMKzo3GaO2tjMy6ZgmMrunAPwFT2vXsmkzQkmog4AwAKdSLkMRH+s
         GG1n6iEVD2FMyL3BpxUto2qkeMioJFN0KbDNJS25fdpEp5hRL121gGhQ72P8K5ZYEXb3
         eZPEwcD/OYeSjw5hIrwKolFNT9Re0rLSVZf9dP4r3LJ1WtvUD1PYqZg5L1taiZA1S9sy
         tCIEQ487PsJ9cFyDw/aqeQZ0MhxKrlGO4AM3sOshdrcGy+zeWTje9Tu8Lfzk9/FS1+el
         YpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675692; x=1793280492;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NjKssOS5UH1EpHAkVpfFza2/uTDAmbwdRnncm193YRo=;
        b=R1Zl+ClltCzkVHl/KxoxT8K6LIF08z6nvrVGm3ujx0w4oFdwrL4TdgAzODUPa2uaVZ
         aQJU5n5YwudmFaU0XpO7BT83QkG9+JVX3JlpiTwaBEwINaCKYmQHjAAiXpPvF4t4sirJ
         agQ/dNgb1/wObkI1ifTveI0oeAA4PySNeTDaGuSrx2DPDjsc27SXWGludTlqsGKd9jzT
         MxYdt0GGYrtUMwFsrcWIG0VgHUlfbsJYOjL3/VOp+Wuvs3MLF4gh6SdcIOUQEOC6fF0v
         rFpwQ9BUk9B8m66NJvju60oNLsAG+cTyTwfQBF2WyaUgJBpIST2h5GbSjv0qABqSesnd
         T4eg==
X-Forwarded-Encrypted: i=1; AKwUvBx4Gp+r+M3jzepsdnyJw//33raA8LqTKwpNUGsaEe7r4Nitl6KBwDYuwvDXtIyRn/emBKoZN2gN3+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL35jB/MHaCmiYTZIUpQHis2YwpWeylDjluITuv+r3fDkwr5hbM
	b/b/AlGn2V//Heuf/wDSE4BJa/FAQcEJeJHWgyTn9FW5PooeNu5U5XwlTYy+ZcJMkI5og+zUi9m
	I987gjly74l2+Q3esVCkwcQ+p6yZ5B/qwC0xvGzny6TYWBgis3NDiiR5uMh3VCOE=
X-Gm-Gg: AYBFou0qT74Km1wtn1PTt4n5iP38t/bCNOP6NOEhKwrVZhn3jamz1jryvII9kzb4psh
	1Hj6yqYVmgIBTux4lyUjrGil1jw3LkEFdx4cM4Cm0aqTDMfjen09lg1k93/yoeuHANbhow1yD0G
	Vk9nX62aPKWKW5z2VROXAsPOHEw3LbK0kkS9Zufj0NDw35Uz7Yg6Yg3tSXwQ4awzC+cjfq24M+a
	F07q13P2khH0TIoTIM6dM5LTkd6FKj9QvCtWTwxTOYBP6cE5B1p9bwysP4jqrMbXfPMvjIC/mPd
	KbcFHJA/MM/ry+J97Prt83YH3zCBorT7haTE7nNc3g+tNuzJANPUVNurfXg7fqnIB5LWHvKC85O
	zWeD0vdDuVxE9KljfbIMGaklyqDgSzAletNUIIZogxwvR6IhFfnOBXvsTO5yrapStOPYwXTsEWd
	h3r+/FaByqymjw
X-Received: by 2002:a05:620a:838e:b0:93f:35a7:cd4 with SMTP id af79cd13be357-93f57f8dd09mr1043821285a.67.1792675691479;
        Thu, 22 Oct 2026 06:28:11 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:93f:35a7:cd4 with SMTP id af79cd13be357-93f57f8dd09mr1043816785a.67.1792675690859;
        Thu, 22 Oct 2026 06:28:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/9] drm: handle IRQ_HPD events correctly
Date: Thu, 22 Oct 2026 16:27:55 +0300
Message-Id: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFsP2moC/3XPwW7DIAwG4FepOI/KGALNTnuPaYdAzMK0Ji2kq
 FWVdx/pNLVamoulX7I/21eWKAZK7HVzZZFySGHoS9AvG+a6pv8kHtqSGQJqUELx7tDyEI+cMvV
 j4mTQOjC6qbxgZegQyYfzDXz/+M3pZL/IjbMyd3QhjUO83DZmMff94fo/ngUHLhorvHDeosW3I
 aXt8dR8u2G/35bC5h0ZHxSEhYJFUYDeExqqqV5R5KMiFoqcFdWi9Qpa79ZuUXdFw26hqKJIsBq
 tlJXamRWluiv1k4+qongvWgKowZlnt0zT9AOVL/0P3QEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6101;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wd7X3ygmQ//zp6nuLlLwGvPWEOvYg8cJNzxOVLDEF14=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGraD17IXihmLxbEsLPpyrTIzdcTunXkv6HcA9yHJFD0eOSPy
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq2g9eAAoJEIs8ij4CKSjVMQAH/ifo
 LhD6DCv1Yxl/5bv7RrJi2g1XgUsc3Xrlp8zT7eKMKnrok48qY+fY06zbCSHWf+E3AS9R1B/F8b+
 JdYv6svg1/vl1NC0ZWPIESK4CUAzqg5yDD7+1ZysXcMhP55HAQHwTZCChjcgP5UQnX0RJUybKK5
 Uul4U1htEvtQlK7IJU9otxtUJzUARmaFwcKivGuTjnO/Olk0SmRKRhA9pcZpH8EJy36lsnIVQMS
 9apCfu+zi2wh1sBMKFO1HmxrZYg0KKQTmS7MAI+CJGaCo7KCK0zY9TdBlHuAf/MuJZBxpyRXTr1
 eEEAxAdkTq5oKd2NvBaLkiNRtm3uvdH7KlRDUHQ=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada0f6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=eKQTCwoLd85be8zhlTQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=3gWm3jAn84ENXaBijsEo:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 3-X3JWXp26DT71fHM9cr_Aeasxa7BSv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX4Os7JVTWOIaa
 aj2L5ZvGVOw33raosNRB2pWug+B+S8w5bXQFvtM3XDfIP4kebdh+WTIdAH9EgM//h99z9UrZgpr
 qEIWCIsA7G4OdL2nl7B0SuPaUTPyrxo86hWURI3Gg5EngKFUCKJROgqspbqT2YfGWXjhoBznKIa
 RvWOkftawnvTkqz2jd2biP1K8eV1yTr9jVhqdN+VQ8txVMtpZcKXHK22pIcZiUAedAIJFX8eRMD
 8/jTd8LjFA+VMy87/S4Cw80TmNk5mrb/ZU7kvqPKDoGgnHNFqAFNUOwwcQJ6Tt36TmbVfZev1Xx
 0KCYbbZAblhVrGPV9BR1CVODN1uc4KEK2/1HNxX/DQ5ZL+7dFa+gXGoysxquLkyjicDjRkQJkNe
 SzqUI/aHRv4rOalqjbyFYn1Coi5CMA==
X-Proofpoint-ORIG-GUID: 3-X3JWXp26DT71fHM9cr_Aeasxa7BSv-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXwYym7xpL8e61
 B2/lAbklJuzAEvHv6dcVLjmxgdcMgQth8v6XfIAw821QbqJS8wkQ8zHeDMEvkqr5lSGxkSWPspa
 2UpWiMnXHkBMHwbUfk2qSIkUkbrq47M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

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
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
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

