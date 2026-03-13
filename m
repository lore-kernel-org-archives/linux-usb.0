Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFF81FF7C8;
	Fri, 13 Mar 2026 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401956; cv=none; b=uxjJnChvoKKAoNnydvgru6jFE1h2m1f3YkBuBsrA6TO2qu8uW3qs3KbnZX5FDwKIyEx1yuhHPiGHrv7enOmJLfEQkSszFsVBqp45FZAY5CGTBEzDZC2LBVzKeHQLWN+zS2Cck/ciDMNnI+Ch4vL6xpxsmxDmGFZhLKTDqS+4yVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401956; c=relaxed/simple;
	bh=fIbAQGqxwS0Tq4uLzFUtZM6sFCs5mOlHEtc2Ryn5UDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAU5dezkZcDO1UdHPCxHAtdAiZgneM46EmyPm+xz7NvpSiEnEDBnEMURpPSdagwIWW159MRymmcijprWsSE6wNxx4sKMEU6pt8vCytgF5if+zHGXqJnio9MsuISdpTs0PxB9Ye3MzxH1EfuACxGgo8k5+U3YUH8qHd5e7SK11hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSp6AyJn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSp6AyJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773401955; x=1804937955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fIbAQGqxwS0Tq4uLzFUtZM6sFCs5mOlHEtc2Ryn5UDY=;
  b=OSp6AyJnkqeY6YqnA4S5575LutHKYeUuSy+xW8j75OuBDmkNtQvLknaw
   ZigYzZa4B5VwxkhTIJ10cQxcDNbN0ioyQ5FhdOvwZl1hPIColwyHslip9
   2D//XHi+beo5IDiizuWCtFMGKHsA24yYJscSKADlaileXCygLdhfQjfdJ
   FFYPxCsmYreC7KdtxzTgFLusoQObz45cDx2x5EATnz7vMyWzNogk66H3p
   UB2RSSTarQsm08XVcXgo+x8d2rXt27X/6ZQaXpXKEF8Pv5f59EIyULVfW
   cyKLqgfU4Br/HXGo1tGyQGFPA8tqtQxUKhbYWYtb4nwkom3R14KettIpS
   g==;
X-CSE-ConnectionGUID: z1XnOC7mReGc+NxSYtCK2w==
X-CSE-MsgGUID: BCLycqDbRuGkF6ovkUjSIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74423918"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74423918"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:39:14 -0700
X-CSE-ConnectionGUID: XyYiaqoTRtqrUfSjh7At6A==
X-CSE-MsgGUID: cchwR0lrRHST+clsnqXtQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="251655903"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 13 Mar 2026 04:39:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 7AE4F95; Fri, 13 Mar 2026 12:39:09 +0100 (CET)
Date: Fri, 13 Mar 2026 13:38:25 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Jameson Thies <jthies@google.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Add UCSI_USB4_IMPLIES_USB quirk for
 X1E80100
Message-ID: <abP3MbB927KPHCmT@kuha>
References: <20260312101431.2375709-1-krishna.kurapati@oss.qualcomm.com>
 <abPQodYcXFT2qxlq@kuha>
 <CAEiyvppvKL+mHpi9kN2z4DASn3Qetd2THBGT5AC8-GiuHKE=cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEiyvppvKL+mHpi9kN2z4DASn3Qetd2THBGT5AC8-GiuHKE=cg@mail.gmail.com>

Fri, Mar 13, 2026 at 02:44:40PM +0530, Krishna Kurapati PSSNV wrote:
> On Fri, Mar 13, 2026 at 2:24 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Thu, Mar 12, 2026 at 03:44:31PM +0530, Krishna Kurapati kirjoitti:
> > > On X1E80100, when we connect a USB4 capable dock, the PARTNER_FLAGS
> > > indicate USB4_GEN3 being set whilst keeping the PARTNER_FLAGS_USB
> > > cleared. Due to this, during ucsi_partner_change call, the usb role
> > > is marked as ROLE_NONE and passed to DWC3 controller the same way.
> > >
> > > Fix this by adding UCSI_USB4_IMPLIES_USB quirk and check for it to
> > > decide and pass on proper ROLE information to DWC3 layer.
> >
> > Do we need a quirk for this - can't we just always check the
> > USB4_GET<X>? With USB4, don't we always support USB2?
> >
> 
> Thanks for the review Heikki.
> 
> So you mean check for all the 3 bits (Bit 21/23 and 24) and if none of
> them is set, then pass ROLE_NONE ?
> I wasn't sure if all PPMs would work that way or not and hence made
> this quirk. Let me know if something like the following is fine:

Well, maybe it's better to play it safe. Let's go with this. We can
always drop the quirk later.

thanks,

> !((UCSI_CONSTAT(con, PARTNER_FLAG_USB)) ||
>    (UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3)) ||
>    (UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)))
> 
> The if check would see if all the 3 bits are "0" and then pass NONE to
> usb controller.
> 
> Regards,
> Krishna,

-- 
heikki
