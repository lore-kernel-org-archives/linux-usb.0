Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69211A262A;
	Sun, 12 Jul 2026 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783843251; cv=none; b=HC7HXjBhYeqxXeXwDaY/GdSnmr5LM7apjmq4Tw3DJleFtYIlRn7gM7uUOWm1DvF0f6Cf3WYbJkKUZbogO9uMirKr3zgwqKL3jqxGcIX0As4qI/ntxn+mKtexQpc57EccspuO9kuAJo8p0MvhOATIvu71AzmykpKnNDziuZVf6WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783843251; c=relaxed/simple;
	bh=fYDmYoYAhY5gXsV4QC8FYwe5sp9yEmsrULj6U6BOCaU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Coi3Ox3AFtp2RLXH5h11avlFn/ggA1JCa4kjpVfN7N2ogtd+49oTAei1OKhxpWCXpukhQVkQiNqr0EZ2VmVZ0lyfI+lEolC62DP/jegjyfg44whV0/M/aOx+fdHGNR/PGINxGorih9BWeszZF28j2EcpgnTx5q7WtPWRU7nY6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TugY1ONT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TugY1ONT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8464F1F000E9;
	Sun, 12 Jul 2026 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783843250;
	bh=1zUEryVLxD22Xe/mTi/wJsFGalkeyjdnEUKUmdqQvrM=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=TugY1ONTR5HgvL1o2L/nLT7TdaL/4cmemRPGmnOzCdblaM/cvtc8GVw4bQyznxIil
	 pEofo1KxHf2ZDfHh65iUIsT6eMVW3AyfclsTktMKYLRm8SC9c5lRieKCqQmhp+huI+
	 ILEhItXKk+KlIxrp1PP7E21HWMzQ6hYKKL/0vjvA=
Date: Sun, 12 Jul 2026 10:00:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>,
	Elson Serrao <elson.serrao@oss.qualcomm.com>,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-next 23/66] drivers/usb/dwc3/core.c:2501: undefined
 reference to `power_supply_unreg_notifier'
Message-ID: <2026071253-evaporate-hunchback-b2b8@gregkh>
References: <202607112037.tVbaUKOJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607112037.tVbaUKOJ-lkp@intel.com>

On Sat, Jul 11, 2026 at 08:47:45PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> head:   1db5c6b0b9834aee2f14e39764becfcc29d09ccf
> commit: 7c87ef27af79b3f905aed2edf9f60ce2a75d38e3 [23/66] usb: dwc3: avoid probe deferral when USB power supply is not available
> config: parisc-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260711/202607112037.tVbaUKOJ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607112037.tVbaUKOJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607112037.tVbaUKOJ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    hppa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_core_remove':
> >> drivers/usb/dwc3/core.c:2501: undefined reference to `power_supply_unreg_notifier'
>    hppa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_get_usb_power_supply':
> >> drivers/usb/dwc3/core.c:2245: undefined reference to `power_supply_reg_notifier'
>    hppa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_core_probe':
>    drivers/usb/dwc3/core.c:2443: undefined reference to `power_supply_unreg_notifier'

Elson, can you please provide a patch to fix this, or a revert of your
patch so that the build gets fixed?

thanks,

greg k-h
