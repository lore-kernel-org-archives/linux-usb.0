Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A41366067;
	Tue, 23 Jun 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203427; cv=none; b=qrpI6QiQsPJE7Ie1tKDf5vmrg5CaLbGDIY3cQsiar4KXggSS1FRqFIiHflCAve2pa0wLGxZ6fq1oeetNKRNkT7PSbklA9zFKXXvzMd8ljLdbssYUgTCFPxPMmKg977D+JpH7mpa2BV0Y8bwonxeimXdRdgTcuxoPqZ9FMRx4s5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203427; c=relaxed/simple;
	bh=Oz2vE0mdaCLvr1qt+CCACUyVDn6lBCT5vtp9issvP0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6rgLw4Xl7vmve1ih1QrVgQBX9AWjl8PSUcbNY02Mgvx7ga2QlECPPJX8bEdobj+wPKyxVUtPlefupcgTQhMDm0hsyyHiIWxCFVrOf8W3caHwgjO6SfYiGXgcaukVTQEfa2YKA9qxB3e/Z2yz50WOim2mB+KAH6w70DVWG6GHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnGmCav9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnGmCav9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782203424; x=1813739424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Oz2vE0mdaCLvr1qt+CCACUyVDn6lBCT5vtp9issvP0M=;
  b=QnGmCav9W9iKomWSfzwD5Ovbv6P7k7QdLq87HlJZBlS654M7KugFjnSj
   f+0hGNZIEjCYGXoiBFnZRobPjr3IrbPFQHsOAbKD/gywIXk9Q0WT2TJRs
   82x+qB/Weac0hJH6o4eY/p+8B8fSeO8E69bYC8k4vWQFBkSUiaUcE9lQt
   40Dy4Dwnt/LwtvSn8Zq+gpTIQ9dL99SHy7uQSdv3rW48/9ID76YSeY4mx
   DpC3iMx/nfsbgMcQpHn4SdlhzSf69EpVqEuRt97+3z+JOKO9/CEIwHRdc
   zJxJHDYvTim0pZiDuv9kFuI8zCysKDww3ReD4cw/VoD28jkF9QnFuzzOg
   A==;
X-CSE-ConnectionGUID: waagVFi9QZittdefxmN6Vg==
X-CSE-MsgGUID: PXs0yxRwQyusGz8mP3KBwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82982308"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82982308"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:30:23 -0700
X-CSE-ConnectionGUID: NdQqotzOTkyefviKiuBMJg==
X-CSE-MsgGUID: Qz+bEjnzQ6WhTRtgN4/3Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273520228"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2026 01:30:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0927995; Tue, 23 Jun 2026 10:30:21 +0200 (CEST)
Date: Tue, 23 Jun 2026 11:30:19 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: Add helper to check cable altmode
 support
Message-ID: <ajpEG7ryQi8im7U-@kuha>
References: <20260622093910.1210089-1-akuchynski@chromium.org>
 <20260622093910.1210089-2-akuchynski@chromium.org>
 <ajkMCz52lkq9hz3s@kuha>
 <CAMMMRMf0kLTJeVztQwDsz8Zm4wBXX52agNpvnKttkFqupQX=4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMMRMf0kLTJeVztQwDsz8Zm4wBXX52agNpvnKttkFqupQX=4w@mail.gmail.com>

On Mon, Jun 22, 2026 at 02:03:48PM +0200, Andrei Kuchynski wrote:
> Hi Heikki,
> 
> On Mon, Jun 22, 2026 at 12:18 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi Andrei,
> >
> > > +bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
> > > +{
> > > +     return unsupported;
> >
> > So if typec_cable_get() doesn't return a cable, this function will now
> > always return false - i.e. the cable is supported? Is that intentional?
> >
> 
> Yes, this is intentional.
> The UCSI GET_CABLE_PROPERTY command is optional. typec_register_cable()
> function can also be called without the desc->identity field.
> Failing to provide cable information shouldn't be a reason to reject the
> alternate mode.
> Also, the cable can be registered after the partner's altmodes. We
> encounter this scenario with the cros_ec_typec driver. I'm planning to fix
> it, but for now, this approach will preserve the previous behavior.
> 
> Therefore, the idea is to reject the altmode only if we know the cable
> doesn't support it. That's why the function is called "unsupported".
> It returns true if a limitation is detected. Otherwise, the function
> returns false.

One day and I'm completely confused again :). I opened the code for
myself (not compiled) to get the idea again. Please consider that, or
something like it - the important part for me is the enum. The enum
does not cost that many lines, but it does make the idea more clear,
at least for me.


enum typec_cable_altmode_support {
        CABLE_SUPPORT_UNKNOWN,
        CABLE_SUPPORTED,
        CABLE_NOT_SUPPORTED,
};

static enum typec_cable_altmode_support
typec_cable_check_altmode_support(struct typec_cable *cable,
                                  struct typec_altmode *alt)
{
        struct typec_altmode *plug;
        const u32 speed;

        plug = typec_altmode_get_plug(alt);
        if (plug) {
                typec_altmode_put_plug(plug);
                return CABLE_SUPPORTED;
        }

        /* Maybe UCSI, or the something else, does no supply the identity */
        if (!cable->identity)
                return ALTMODE_SUPPORT_UNKNOWN;

        /* Non-e-marked cable */
        if (!cable->identity->id_header)
                return CABLE_NOT_SUPPORTED;

        speed = VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);

        switch (PD_IDH_PTYPE(cable->identity->id_header)) {
        case IDH_PTYPE_PCABLE:
                if (speed == CABLE_USB2_ONLY)
                        return CABLE_NOT_SUPPORTED;
                break;
        case IDH_PTYPE_ACABLE:
                /*
                 * Active cables must establish an SOP' communication
                 * node. Since that check failed at the beginning of
                 * this function, this active cable does not support
                 * this specific altmode.
                 */
                return CABLE_NOT_SUPPORTED;
        default:
                break;
        }

        return CABLE_SUPPORT_UNKNOWN;
}

bool typec_altmode_cable_not_supported(struct typec_altmode *alt)
{
        enum typec_cable_altmode_support support = CABLE_SUPPORT_UNKNOWN;
        struct typec_cable *cable;

        cable = typec_cable_get(typec_altmode2port(alt));
        if (cable) {
                support = typec_cable_check_altmode_support(cable, alt);
                typec_cable_put(cable);
        }

        return support == CABLE_NOT_SUPPORTED;
}


thanks,

-- 
heikki
