Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232B3A4F2C
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132294; cv=none; b=USCNuCFHsGG839u3mgUjgDn0M6/TjyxOwqWm17s/zJdQQClqr+A9cqBAWuly/34wVwCqcDYmx/QMydqD5HjrN1WuCjRKShgihcInsvuXBZbdgVv3Fs8/2n2Nef68gEIWRTdlNb7W7x9qGTjxPXXrTBTkVsZaFIuwXjrSkcu//TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132294; c=relaxed/simple;
	bh=EDxAEJzSTX0sFjtpXUgCYVSO4mjZBSAyGed0+Wx0DEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBvhPJ4ZgroowfKhZ3znZZRPamr42uB4az0wmtUbjc2IeDxkCXQEhJ7E5Tgff3fZ4GKO2xX8zZGk9m9s8hMI//f2ZH6hYGruoTQtWi6e66I3CPpHNAckG66+N4d1wc3OOCo4Ra0cjy0B9c9mrqouHtjSM7IDvSlg9DHaMLNJzQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vQiLTsn1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vQiLTsn1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4F1C116C6;
	Thu,  2 Apr 2026 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775132294;
	bh=EDxAEJzSTX0sFjtpXUgCYVSO4mjZBSAyGed0+Wx0DEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQiLTsn1ve/2U4fsIEmQ58A+j29kqhfE/pFR6VjHx0aZRCyReY06UBC9PKgIFwlE5
	 zliLnyorqlCr7oSEmnSYg+x3rd3rHls8kmFhA/LN3R5hRNoaJYyUdtaUdUQUS4mbZf
	 bhc79AQU9aXEFhOU5aucU8YrmZfc6+yhAHLq0qus=
Date: Thu, 2 Apr 2026 14:18:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Fran=E7ois?= Scala <francois@scala.name>
Cc: linux-usb@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] usb: typec: altmode: Fix altmode to handle multiple
 parners
Message-ID: <2026040254-exposure-stubbly-7239@gregkh>
References: <20260402120433.22967-1-francois@scala.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402120433.22967-1-francois@scala.name>

On Thu, Apr 02, 2026 at 02:04:32PM +0200, François Scala wrote:
> From: François Scala <francois@scala.name>
> 
> The partner field in the altmode struct is a single pointer and the sysfs
> symlink uses a fixed name. This cause an error when a second partner is
> registered.
> 
>   sysfs: cannot create duplicate filename '/devices/platform/USBC000:00/typec/port0/port0.0/partner'
> 
> The field is replaced by an array of pointers and the symlink use the
> device name to avoid conflict.
> 
>   /sys/devices/platform/USBC000:00/typec/port0/port0.0/
>   lrwxrwxrwx 1 root root    0 Apr  2 09:12 port0-partner.0 -> ../port0-partner/port0-partner.0
>   lrwxrwxrwx 1 root root    0 Apr  2 09:12 port0-partner.1 -> ../port0-partner/port0-partner.1
> 
> Signed-off-by: François Scala <francois@scala.name>
> 
> Thanks
> François

No need for the "Thanks" here :)

And what commit id does this fix?

thanks,

greg k-h
