Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6F41A79E;
	Wed,  5 Aug 2026 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924016; cv=none; b=rIuOJjEev5UockXCAqNV/b/XYYSxJTcAe0qah5+Kq9DNPu1BqwDIBQgCfc0n0oIHPYaklBCBSaqfzA0uV2KbwGrLjsxo5fNhLGtl6H7+syHqJeid3lWm1Is2cy79JutRjT3z50wUs+2uNcxg5w8wZohMR+8ioH9uDSHpm/UADaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924016; c=relaxed/simple;
	bh=E8oy9q28UC9GKZJgxE1gq94K+hxs7w1tFUeWqEnsqm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLDyPXk8eOItjgaeR2zFjlTxGYliUnoSJbgvAT+F64Sr+EWsEbutSkfVx0GqO2QhoRwYnBGjyMlCW9KFq/VB0ZYRj0uQ0jfIRiH3WRoPQztBQcEP5nlpFiHMT1RdRRNeuZp2mzjRYX4/ogAQ3eb02WSqHls/OsOMQo42QKbaBsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BA+IdWFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BA+IdWFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E381F000E9;
	Wed,  5 Aug 2026 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785924015;
	bh=Qk4gSF+75s6WiDV6XpU2j76tq5FZKiuoBsUZP8gFDVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BA+IdWFMeS0bv9BedKbhThFiCMgD27QDOuWqGNNwn1kddqRMkkiFGL+mBFeVECRhw
	 wci7LcaeUKWvtUBv9jslRPM42vvxC5ayyTsqmPDHh5cFwjWX5htq9f27rEcUsmLsEs
	 NvjHvy/zSWn8UZdvhDU9DTsVyAz4bf8E4Z8ASEvw=
Date: Wed, 5 Aug 2026 11:59:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: guanyulin@google.com, rafael.j.wysocki@intel.com,
	sakari.ailus@linux.intel.com, mathias.nyman@linux.intel.com,
	eadavis@qq.com, kees@kernel.org,
	dominique.martinet@atmark-techno.com, khtsai@google.com,
	stern@rowland.harvard.edu, oneukum@suse.com,
	marco.crivellari@suse.com, thorsten.blum@linux.dev,
	amardeep.rai@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] usb: core: defer leaf-device resume off the S3
 critical path
Message-ID: <2026080500-unbalance-stunner-ed45@gregkh>
References: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>

On Wed, Aug 05, 2026 at 05:36:41PM +0800, Hongyu Xie wrote:
> Gated by module parameter usbcore.defer_resume (default off).

This is not the 1990's, we don't add module parameters for core
functionality that should "just work".  Please make this dynamic and
work properly for all systems, without a boot option, and without the
#ifdef stuff.

thanks,

greg k-h
