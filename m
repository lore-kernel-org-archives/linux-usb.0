Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548263793CC
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 18:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781290420; cv=none; b=U8Cd1Xqg+SUocDLveWfF4WYJmnGz85OjnyAxjmbLhO5HjYIJ+QkLjBe2SuHWAoDQ2hxjpRpSFRJ6JWeqFtCfkpMmB4dJw9BcS2y5uoCnqLbtc/0qNDx8fDKLup0fzw/xCCSk9UTVbB3z8/rp7t1BygqKlYHdtQVEInAF73VK9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781290420; c=relaxed/simple;
	bh=furqK1o6jfSd0OFBbqBOE8PH1XZp1rGcc0CGC1Eovog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaZUYuoHmQBO2LucmtmkCi7f3NxfOiDn7DT38fL5ZID/scnIrLDBEehU4FudoMLrAUBW9LCUVGjDv/lshmZ0RYza0BzHF9ETqv+SWtBnJukhPhk4iCiw0SFD7FaUQJrnPBHOd2l53JGt5ymGFcutFpZFHQYUbbJDFIy7XbnS3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyzaGnik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKhiUUHt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyzaGnik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKhiUUHt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGV7xU047283
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 18:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3/Hm6Xq7WCrgTyuR+mYm99o
	byQyGcdOpmpb0F6ke1c=; b=QyzaGnikY7lvP+gYNtF5B5gsq2WmUJGU6b/iEyc8
	SM60hoYQ877RExS0N7DGLbXtTL5/6KRJJw7ZeGH5x87tjPexRkoTotluUY0BnFoF
	HkMji3P7vnUoJFsacAa7h3IxAfTGy3w+v0t6lhiq0m2CPW7jNKXBP9dy8oZQAYes
	/x7yvsuAm61BlmQgJFdUBuRG9rWEKgjMq6Ve3gPdCoUfGxiYeVrB/2byyKH95qPH
	2lgtErJZxVrg9WL1eI0Tx9nasXDLeiH+aWXhjUscB+gmB6mXz9YnPbeuLzbPtaHi
	OJTYOJiWMIh/LNLvFxLza8JV0OnU+OYW/dSj20tJKJptdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u4439a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 18:53:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156ceb551eso196623085a.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781290417; x=1781895217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=KKhiUUHtM8dA6ZzFuAYqhg2LeIDehTRz3Q0FInDEQV2jhvJZc7VMxCMWhtVPghsTLW
         r8vzIARQDH14HA6jxtYqygxUGh4IxYvQbsLbr0laQDG+jeIIqCK1pR/9H/mcqHlRzLRs
         C/ytS/ro1pQk3jO+nUNry40Vq2v5LphHmcT7czp+CF8evkZZecdyq04nEJPlGZ021fpE
         gafdWc7uz9o3sxXg53CbLfvj4olS23PiNk5Hz9pt3iQy/r1lBtMge6S16Hto0w/MvUN0
         74IFUZiL6LB2id1QbQAFPRMJEviQ+lhO5RC5DRepm6FGzUB+AKiaKa4Ve0ZCRS35tMig
         at7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290417; x=1781895217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=AVKcb/BQUJOUxWJ4IelCI/49p8EgRmb1Fr2WAr1qmRCOX+kwQzTAlweK80yxG0GcvA
         JHGadgNFfchYOl8UfbuI3gMZ2yihOKJt2BZD1DIpv8K6x2NTNcNS63+8k+qfkq9dmU91
         LEdEBPQwSv5D2yKQywfzIN1eNwxW3XGSNolYgZDrapxEeYrYmv+VVKDJSDqnf15Ti/vT
         WTV88hk17ezu+edcJklKg3wW4tI7cnNce3uTPRuvo+ElZNCr7Hs4rbOlZnlpgDnx+17+
         ld6/NCGgjOQqoVmggUTVYw3U63lEVRzXkHRuYWNLIfuUG880omI7GjdqjY1J9aJRszTu
         yi8w==
X-Forwarded-Encrypted: i=1; AFNElJ/YWZDbcuZBf+CICI1oIqkRLnum+jIyG0uUq9xwcF1O68b5A2+bDgWax/v2jeUIWDcS1yrK3r3gO70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWStAKV69eNFhxQIxknvaeis5P0GNqDGYtDX3SURZ4gI+Z+SU1
	JcqhxKEqVH6Qs19akn2tv9KFKIGWJz2UE5ttzHKkfDSPBSEaDkRfOjNSD4rbpyQVR5WxBsjssrA
	Iir+ipqo3syZsOBIqXmON2+NcNhV2hrYrwEkfOkXz1LdIDoa45Omr3GyGDvSX61I=
X-Gm-Gg: Acq92OGwPmf0w1vxsY+cCWK7puHjK7qGROnS1OjBXFFKi7vKNSVh7JblxLPQtwTqidi
	KZP/Rvfl5KZDTSKUpCGc4KH9dBwPye21AsbqB5bldakPJN107akhWItxKZaDfVUkmD/IHG5ssNE
	nSMjRZZQwlyKfBNjji69SEl1ANGBMrdwfC+doIXTNLbLDkc9oP8z8zCoVwaDeTeZcDwh2VhhANc
	/btkBy9qq+OXLNU6y49gpAtW0pbBmoMoCXb+ogIUaMVBFDHjp2BHMsbrhmDj/xrmeSZPzCJo+L1
	n2x/qQ5YSM418l+XL7BOQ646MyGq8cxGUXzw6ZMXC4hC6NSeeU+r3ZHPrWpfBieHmXJUaiqMaC7
	q31iHIU5AgN/EowuCBqhE2wkWJ0sIOEkQ2dnf8YHIcueOrOiaFiycxrF3zEG4drgYTUuvFFQZBo
	bfAr5uyUEGuoDTKmQF1HCX/Mez4PlYwyr2jMs=
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559906885a.32.1781290417442;
        Fri, 12 Jun 2026 11:53:37 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559899485a.32.1781290416844;
        Fri, 12 Jun 2026 11:53:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1absm726479e87.59.2026.06.12.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:53:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 21:53:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/8] drm/connector: report out-of-band IRQ_HPD events
Message-ID: <hxto2g32oyfy2tlihdgpjy7bwkhxp2cdw7qnf2rvpl7g7jczen@5js56gor3z6t>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
 <20260608-hpd-irq-events-v4-1-30b62b335487@oss.qualcomm.com>
 <20260609-bouncy-tomato-dalmatian-70ccee@houat>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-bouncy-tomato-dalmatian-70ccee@houat>
X-Proofpoint-GUID: bPufeHFBSzKHRZgbmcWtVcyvjuPgmDPI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfX7j6sUZ/uwTMr
 TNAFDV6KzXimwTLVBKEviGeCjnLx3gzFN3VecK+CCnuqESwh4sj+SLQHVDKRUkkZtYD5y0F8bQe
 BXf8ajfAt9DlGsu8XaW87naMpGJ7OCQ=
X-Proofpoint-ORIG-GUID: bPufeHFBSzKHRZgbmcWtVcyvjuPgmDPI
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c55b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=Qs5g3gW-Ea0FhcstOt0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfX3vuls1qGk1r1
 bwy8QY4afVBelhMFqDKkTdb6nHHaBKHd2c6WcvWARJxEtoQcWafbN/elZJP4Ha7hmdF4BObQ9kc
 M2kp1WjOfrAbzIk2V7a1lIVJahee0pvrG2U/WyUGSFg874bCtWuUtDBSbrzANFXrc+zotivM+1w
 C0EO3gydZ/lHDkfEbaV9yLz76FPc4iWC/Md/oM3eTvv5m7k0Jofx2sl/zDneMabdTE+aQhPZ9x9
 l6DFsrxY8Y9ISLS6YIBL6aJyj/EyFt9Op8tD2d8CtyoVlOgF8ytdnaFQvOe2+SCtOiwU3CJX2cX
 /7hPWU62GNyOxvNQsoaYCqXqS+82XURs7lnocFJhLdG8IL73m4EOpk+IR1XFjSAU1Bq4ZU4lTSu
 ZWiyeM9mxPzaAZ5yHv76N8fQasgB4e5yhnCSr4I3uP90coScNJ+vyeol5Qx3wPm7G4BEY9u3Zaq
 Y/lImB5HBu0CQ7eCILw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120176

On Tue, Jun 09, 2026 at 03:20:01PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 08, 2026 at 12:33:02AM +0300, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are reported through the bits in the AltMode VDOs.
> > 
> > Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
> > and extend its interface to report IRQ events to the DisplayPort Sink
> > drivers.
> > 
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
> >  drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++--------
> >  include/drm/drm_connector.h              | 21 +++++++++++++++++++--
> >  3 files changed, 46 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 3fa4d2082cd7..bb128dd0263a 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3502,20 +3502,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >  }
> >  
> >  /**
> > - * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > + * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> > - * On some hardware a hotplug event notification may come from outside the display
> > - * driver / device. An example of this is some USB Type-C setups where the hardware
> > - * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> > - * status bit to the GPU's DP HPD pin.
> > + * In some cases when DisplayPort signals are being routed through the USB
> > + * Type-C port the hotplug event notifications come from outside of the display
> > + * driver / device. In this case hardware muxes the DisplayPort data and
> > + * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
> > + * pin.
> >   *
> >   * This function can be used to report these out-of-band events after obtaining
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> > -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
> > +				 enum drm_connector_status status,
> > +				 enum drm_connector_status_extra extra_status)
> 
> Thanks for the renaming, but I think we can also rename
> drm_connector_status_extra to something a bit more descriptive now?
> drm_connector_dp_oob_event? status?

I did not want to introduce a DP-specific interface, keeping the HDMI
eARC HPD in mind. But... Let's get it nice for DP first and handle eARC
if the need arives.

-- 
With best wishes
Dmitry
