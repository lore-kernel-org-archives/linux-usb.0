Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC02C21F4;
	Wed, 11 Feb 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770799432; cv=none; b=g3bXVNHT9Smg77efo8ZKYEQejEdwna5o08GKkA0uDUacAKlOT/dzCK3dQn1fXIPqRme5KuKSKlU4LCkyE5tcHAkvubbFCyyvSZ772BHMftlTZoAU666GGy0p/W7WwshJ9H0OvraFBhzxDDoynzsReBqYpdXnRdPC7X7UoWqyGw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770799432; c=relaxed/simple;
	bh=3o2LT86Cpq0S9GuARjYX/zgN/9pwzGYDwoW+ifnJkuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiIrbttAp/f2qhX6BqOK+Du1MXSe6OW46xPYTHnuWZapZgkg/hsY7htN/O2rTb6O4CO78fr968XuY5PikY6+6VpNpLt39xicPrm7gx1zdeZcB0I3b7uEr2lpRV1tzF4qjCEK37YJFzSZZZscAfDJQNyDiaCh7YyxxTVT3DH+ep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k21Vcemb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k21Vcemb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770799431; x=1802335431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3o2LT86Cpq0S9GuARjYX/zgN/9pwzGYDwoW+ifnJkuk=;
  b=k21VcembOGQpLzlj5aYUqjrzIQ+3TCAMHpNYHxwOQtrcRQxTRl7B1asM
   B9UM8pE5FGfXikoFbmjgrIFy8y708HiXmV+aH+LOPh0axkceL8EmK2M17
   oJVkLsjSFw5i6DT7pk6t/jqn+PlT2r5bj38TkcTwrSagfW12LPBEk5TVQ
   nAeKRTSPwybtlgI4z9GAg1dssx8hgpsrhGUz6dpb5rXs/7NSLs3oNtrDp
   TmZQxw+C2H1WDLJOaXUySbNILGxNU6rBVpBMrXHz5nuwRA56H6KVsWgQs
   hdP3PgjZxGNP4GDlWKygrASpIg2YEJeHOlLGTmefxx7slMnkNucuJceHR
   Q==;
X-CSE-ConnectionGUID: OAENlmhnR7+NHCxmOuhXoA==
X-CSE-MsgGUID: s0aAIPclQ3evFoiyYsGBmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72014465"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72014465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:43:50 -0800
X-CSE-ConnectionGUID: wspm28cvTPixzZhK/vSbHA==
X-CSE-MsgGUID: Dp/HPpqER46iA631TRidWA==
X-ExtLoop1: 1
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO kuha) ([10.124.223.196])
  by fmviesa003.fm.intel.com with SMTP; 11 Feb 2026 00:43:43 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 11 Feb 2026 10:43:12 +0200
Date: Wed, 11 Feb 2026 10:43:12 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Pei Xiao <xiaopei01@kylinos.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <aYxBIIkztIkuVSiu@kuha>
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
 <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>
 <2026021133-mystify-division-2468@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021133-mystify-division-2468@gregkh>

Hi,

On Wed, Feb 11, 2026 at 06:36:50AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 11, 2026 at 11:32:37AM +0800, AceLan Kao wrote:
> > A gentle ping.
> > Please help to review these patches, thanks.

I'm sorry, but I don't seem to have this thread (probable because of
our spam filter). This reply from Greg is the first mail I can see.

This is a Dell platform, right? Did anyone contact Dell about this?

thanks,

> It is the middle of the merge window, nothing can happen until after
> -rc1 is out, you know this :(

-- 
heikki
