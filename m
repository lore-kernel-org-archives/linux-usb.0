Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182934;
	b=KrhDkjFtmnw42AUjemhXBiDeP1OstguOIeTOvQYDlRfWm0qYTLQHfYYptMVzb/zXPiBQ
	 cvWMnp98JZrYiMeFJLxDoxKa2dPSrbhYak/h37+8HcValghgM/un7vYt2h5rZsNvZfoiV
	 6BCytn9fkC5weR8C9J5olSyezZ6W08WerwsiNTRBlgyhEwHmKyBA0bSkWyijee97QLH6E
	 EJZ29DYidSR5xVHEgsdO2Hp1Sqq47Dt4mwMwtrRP1ES9RS6o/N0ko2bhMzQ0NnqquqohP
	 oHxiaekdHNZEUy8/IhTRQxUUNbRf/4wvaA5OPAfd74Wj/wQlmuF0tCKipKKSzbqVujg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182934;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Nklao6wnbCqahs7I245n8XnLlluXuXccuwmh9REh5jU=;
	b=rvA7T/odyl4JGyUpZtELinQ2RoxAol01xrgTC/kragaIkrUbNDyWCT7pKq4SKx+Awomo
	 m5siHVA4AsYG9iPRrNYH0XAb/LgtcA3y6xLdqM8dmtjDEYu2Y37m3ccq+jDOGGe+HjSrx
	 EhoROGqBSc13Nin+gZsqdDNYzqsFhYX7VTxSm8iNZyLPg8mDJa5UMBxT0y8ePcrgXvouB
	 3QMCOCEGlke//hJwFf6SaIx7Y/GmYHtttT1R5DV5bS+Vx104lZi5HaS6mIiZu68hDyynh
	 xtB16EnG473il/nlj2WSXCm9LZ3wMlTv6vQCLEWFW+4lx3bOh41yhxy2pWLNzQRZ/YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="TUV/T4mI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED62606A320;
	Fri, 20 Nov 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TUV/T4mI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E7B1F000D2;
	Fri, 20 Nov 2026 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795182933;
	bh=Nklao6wnbCqahs7I245n8XnLlluXuXccuwmh9REh5jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TUV/T4mIfkSgDtF4uXV8dtwLmO2ut1LWbp2OsGG80/QLw+fmCAsdz3ascF8yLkUcN
	 jTPUkTusgVwgG5R2RCtJbosu0mi2rIOAWbdhbGlh1dxcI7gLMxpCV/DFrS1MQBbj/X
	 +XqdkJu8K6N61KXDIw72soEbeZN0GzAxeH53cOE0=
Date: Fri, 20 Nov 2026 14:55:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
Message-ID: <2026112020-reviving-pretense-0353@gregkh>
References: <20260910105359.12915-1-syedtayyabfarooq08@gmail.com>
 <CAKD4hN7z8Mf-EXJ9DUhDuxzbbEWShGM1aSQ2=5SQ=8F1wfVprw@mail.gmail.com>
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
In-Reply-To: <CAKD4hN7z8Mf-EXJ9DUhDuxzbbEWShGM1aSQ2=5SQ=8F1wfVprw@mail.gmail.com>

On Tue, Oct 20, 2026 at 05:41:33PM +0500, Syed Tayyab Farooq wrote:
> Hi,
> 
> syzbot has tested this against the reported issue, and the test passed
> successfully.

Yes, but the reviews for it are not ok:
	https://sashiko.dev/#/patchset/20260910105359.12915-1-syedtayyabfarooq08@gmail.com

