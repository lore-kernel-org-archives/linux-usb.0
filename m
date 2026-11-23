Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409862;
	b=PJvp5kAKmDyAE4jGA2DafqcA6y5SMpzMvDQRy3JYbOTri1734KbSLentLjRDqFGqQJwU
	 HnyctDm5ssL0o4CbHabuyC8xl1EJxYN3zFaFWBErqd2dcSV8agHJm5UD+WT6iuIBQpBDB
	 iIDxWxSxZgEpntp7WHwM6j2UEyIAKW2kVxOxFFzFVNRCdBNE47OSauaK3oSr4kDkkdwOz
	 RgctqLicMwSVVCZjoJ3JcCfTVSA9575K/YxGjEFTH7QQrIgJhkzFYKJqlqC6zqoqhh/Hn
	 PXdNbO8au8+142z9IGiMAKWpiWhfcrekxAuJykZX5PuFdSVkniVOJMSpRC2/hE5Jukw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409862;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IFowlmz3z5BjjohkgzqWvkgBleswR5QwPWdwDOXSerM=;
	b=aSu4+18CCu4K4w9cZh9NM3PkBbcdc0XhDCCSJef5DK2UHhN7LngBYAGW9fC6L7rKTOng
	 TXf4oWySStbD+vCAWR7GsG+nMB1mtkXpROauggKDApU3pneRDb5u3UxcMoKtta6uUqOLV
	 JoLvjkzPUg9Z5xBYfZkJsRxnj5OE0O+t/rezUNBDLWLYtQ6bC7LsydzVsaRVQz+7o4+5L
	 uk5eyVh3ZQl+3UaCehzCXbTMYht93FLDuky9G5PtGMOPkeRiItJ9109RUYW/4TOmZjvY9
	 7ug1swJfFeQyY9ABftp1Uy7HdDFf3cnQ/cNb+D78NZPLEX9dZRMbD0QgedHb4Fmf6pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mxLwdFO8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B6606A330;
	Mon, 23 Nov 2026 04:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mxLwdFO8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D284D1F000ED;
	Mon, 23 Nov 2026 04:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795409862;
	bh=IFowlmz3z5BjjohkgzqWvkgBleswR5QwPWdwDOXSerM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mxLwdFO83K86vU8ekQ10u/BchGDJuVVTuZINZIQTTkOrZTNrZ+hnDDsH80R5hT/kb
	 q46taO5EXifdpJ950uRzoxSwu1SnEOIqFpK7Uud/nsYwoIzGWR/36mDZozSxhl6S/r
	 IJHxvhQ2UjB7BHuaBZ955m3Olb44p8ZVxKAMrtYE=
Date: Mon, 23 Nov 2026 05:57:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v2] usb: xhci-pci: Add Power handling for Card
 readers on Apple systems
Message-ID: <2026112320-uncanny-extruding-7e46@gregkh>
References: <20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com>

On Sun, Nov 22, 2026 at 11:44:09PM -0500, Atharva Tiwari wrote:
> Add Power handling for Card readers on Apple systems using SPWR
> ACPI method, SPWR(1) turns on the card reader, SPWR(0) turns off
> the card reader, on newer systems SPWR just writes a variable in EC.
> On previous systems it writes to GPIO pins.
> 
> Its also used by the macOS driver with the function
> AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.
> 
> (This should fix https://bugzilla.kernel.org/show_bug.cgi?id=111201
>  But thats not confirmed)
> 
> (Tested on iMac20,1)
> 
> Changes in v2:
> - Fixed grammatical errors.
> - Added CONFIG_ACPI check
> - Checked for xhci_suspend success before turning off power

changes go below the --- line.

thanks,

greg k-h
