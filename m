Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458B3BE629;
	Wed, 27 May 2026 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868955; cv=none; b=VKxoe3+Kbgw/dxAXFImPU3jx5cXCm3xN3QMJFFUyDBRTUE/ax3VpzFmH5WIcvVlQecqYBzDR+zZGwNxDk6lbj2ltAWoPSBnUe4vrOqei5Mj3jYqSQO9VzP420AaBhenGoGERbL52zW0uY/6u6ZehD78k7ZylhgPGEXY6oepuF5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868955; c=relaxed/simple;
	bh=S0Xrbv0lNKk0asDYpmBRPDIj6mvWsqcVfNXAUoJcK6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHIU/EyFEAWh1jdZMgJRk9LRULkYI9PZXX9EbjJEjKYPzpI55c8diaMGfRUkQNHzlRyGZW1xcIkpuVLSZ8hLT7qiYM6COUzyTh/fp2mbds0AQy/OJ4uZstbRFVFcEFqffxZuymOx0XtsVMH41xWrV7hKXuUdQfzHC8lOM8M77aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rvNZZQq0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rvNZZQq0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247581F000E9;
	Wed, 27 May 2026 08:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779868953;
	bh=Qbv2Y9F3cnj/XHG1rndTCQSdk7JT+eMPREPWRrHcAuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rvNZZQq0wYarIXHhtHpT2rFcpx/jdKoZ/TTsEVfiHF/GohDFim/jzIO/MMstYYCbj
	 FO4Ha5U+IAtEiAMOBQIkg3+B8togviOYLREUk8Vx7NSSBCMq2W0eXfqs/qHv3HDe0J
	 lWdr7QO6TnKk7CCgLdaJdv463Dh8IIFLQWCL7EOA=
Date: Wed, 27 May 2026 10:01:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Igor Cudnik <igor@its.rel.pl>
Cc: heikki.krogerus@linux.intel.com, mika.westerberg@linux.intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: acpi: fix undefined behavior in
 USB_ACPI_LOCATION_VALID
Message-ID: <2026052703-visibly-sureness-dd24@gregkh>
References: <20260526174513.15692-1-igor@its.rel.pl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526174513.15692-1-igor@its.rel.pl>

On Tue, May 26, 2026 at 07:43:37PM +0200, Igor Cudnik wrote:
> USB_ACPI_LOCATION_VALID uses a signed left shift into the sign
> bit. Shifting a signed value into the sign bit is undefined behavior.
> Use BIT(31) instead.

SHouldn't this be UBIT(31) instead, if you were really worried about
this shift?

> 
> Found by cppcheck:
>       drivers/usb/core/usb-acpi.c:221:24: error:
>       Shifting signed 32-bit value by 31 bits is undefined behaviour

Is this really a bug?  Look at how this is used, is the generated code
"wrong"?

>       [shiftTooManyBitsSigned]
> 
> Fixes: f3ac348e6e045 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")

Is this fixing a real bug?  Or just papering over a buggy tool?

thanks,

greg k-h
