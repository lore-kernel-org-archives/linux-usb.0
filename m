Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF7C41F348
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504569; cv=none; b=DMKpnZ8y8Hfey1Dyzul+L4efN6QFY8B545xouJiIcrUlZkgfNYREY4v97H9/eL/XRyfMmoUH6YvlK0U/L+NbLQKVvH1JCYqP5fL3pwJeELUWc7aZgS6jTE8k8mElp4jW+Be3vNlSyDXy3qMA5GJilxYOQvyxfX+vuvK8+0wi22g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504569; c=relaxed/simple;
	bh=b3qPsk6pQSd5jPE1usLaXIKwRY1UtwEVDsiog+Vz/B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/ZKRnfO7KiANiJUvxgLUpZ/yZc9dgtGqkImgG/HM2homOTF0k+dDYwySejgIc4uQPSoOb28P4g/tjAudshJ+y+BSfGsjIDvbp21uLzq9ALuz4HzQEmM0kYePdCTOJVBpTC2aqqCcWijT4ijmbgslZRTd1rA0cMc0tpVhkFNrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DwH0P4r0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DwH0P4r0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0213B1F00A3D;
	Fri,  4 Sep 2026 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788504567;
	bh=6IbDK9gFvpsdqFIM7sGxdQ/HAYDSwGbLTv/MJ2TI2jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DwH0P4r0Kc1ullCuhbk61ac5BdbRdqyD7rw6uisb7w1nk/mZ2R2Xfxt2rpNQQRXT2
	 2LrnPYAtzOQlLAnS9u1ocd7yn4zJr28G0ADoAHlNGw5jhYdYGaEsoZDPwt8Edy8BNN
	 e/r2SvQkuVmFWlKd6+aD9wiSXvEDouETRN5htbxk=
Date: Fri, 4 Sep 2026 08:47:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: rivaldihormat-debug <rivaldihormat@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: devio: add defensive bounds check for len2 in
 do_proc_bulk()
Message-ID: <2026090433-repayment-duplicate-bb50@gregkh>
References: <20260904063918.21213-1-rivaldihormat@gmail.com>
 <20260904063918.21213-2-rivaldihormat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904063918.21213-2-rivaldihormat@gmail.com>

On Fri, Sep 04, 2026 at 06:39:18AM +0000, rivaldihormat-debug wrote:
> Although the USB host controller hardware prevents len2 from exceeding
> len1 in normal operation via babble error handling, add an explicit
> kernel-side check to improve robustness. This helps prevent unexpected
> behavior in virtualized environments where emulation bugs might break
> this guarantee.
> 
> Clamp len2 to len1 if it exceeds the allocated buffer size and log
> a warning message.
> 
> Signed-off-by: rivaldihormat-debug <rivaldihormat@gmail.com>
> ---
>  .../net/ethernet/intel/i40e/i40e_debugfs.c    | 1855 +++++++++++++++++
>  1 file changed, 1855 insertions(+)
>  create mode 100644 linux-6.6/drivers/net/ethernet/intel/i40e/i40e_debugfs.c

Something went really wrong with this patch :(
