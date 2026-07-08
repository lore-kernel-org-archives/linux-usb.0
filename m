Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387F943B6CD;
	Wed,  8 Jul 2026 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512698; cv=none; b=ORkkgPjFOfxx3iBitH3TGg0Tt4TNGsBALhAK6JFFNdLyV+GUwrAZWHjNCsQ4agy25DoGQ6DS6oZQu2ZyPLsC2PS8Vzuc+JRf4Vtk+871h595sx74Dp0Z/gTt/2Iz+T9m2wYtWKo8BQ5MH0x1XTAKjIzTgAb8w0cXDYm59UqxYC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512698; c=relaxed/simple;
	bh=K9g011X3Xs/7WsfEQXpzqcfzO2kO6HXcoxsTyJrlgBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL9Pwf37TmQdGMCHy69psvOcsezavtgLT9rHjmxjQLAEerNYZBZrSCBtUYiOwN2C0UWipYQr2bPSKSebsUm6MpEs4Ya7hAJpwj3nHNUqwYiXLx17J9XOnsr9+3rtEQGnn5bLs4RxM0W+HSSz1ja4iqgLdQIEteFTc4F4REvpA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xAqwCldm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xAqwCldm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A191F000E9;
	Wed,  8 Jul 2026 12:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783512696;
	bh=2pNwDjVYUy9ntK2ijWQIXmJKDbbbfCLmkp9XTcqocOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xAqwCldmZz4Fl0p8klsPYL9WYIU6a2hMs71mGW9KwZV3+3lKc3NRJsuvs7dQA4q+d
	 32XUKr2ydxHYLWejTsmdYZcYnXy/KiXlVHabukBppyCQbNRkzRTxQ3GQolqsKggLvB
	 Y61dPdaRFDMuGkxe4XNaM3soY4p2mT1aHIUCW/UM=
Date: Wed, 8 Jul 2026 14:10:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: gaokun: unwind notifier on UCSI
 register failure
Message-ID: <2026070809-audibly-panoramic-466a@gregkh>
References: <20260622153230.75195-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622153230.75195-1-pengpeng@iscas.ac.cn>

On Mon, Jun 22, 2026 at 11:32:30PM +0800, Pengpeng Hou wrote:
> gaokun_ucsi_register_worker() registers the EC notifier before calling
> ucsi_register().  If ucsi_register() fails, the worker currently only logs
> the error and leaves the notifier registered.  Later EC events can then
> call into an unpublished UCSI instance.  The remove path also
> unconditionally unregisters the notifier and UCSI device even if the
> delayed worker failed before both were published.
> 
> Unregister the notifier immediately when ucsi_register() fails, and track
> only the fully published state.  The remove path then tears down the pair
> only if both publication steps completed.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1:
> - Drop the two-flag bookkeeping objected to by Greg Kroah-Hartman.
> - Keep the existing registration order, but use a single flag that is set
>   only after both the notifier and UCSI device are published.
> - Unregister the EC notifier immediately if ucsi_register() fails.
> - Compile-tested only; no Gaokun hardware was available.

Does not apply against 7.2-rc2 :(
