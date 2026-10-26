Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025281;
	b=dEzIGqE0h9ClYfQpEi1xwhurwBYzYOQHOs/YHZv1U00R5Gcpo4haaWNtY8lbulNon2b2
	 DEhSeilu/dSqpe1bC+3Dzi8dqO6vzNqWbRn4DIVw17ic/sIUd66+XnB44VlgPsNqtkfxG
	 xGTuCbbkKUV5k4hlSmlOiYrwEiqfa+M8Y4VrgctrpQSFpbdJfhImAfLIsPXUP5tiUNdQQ
	 1CoZm7tt36u2cOXNjLR6tH3DBYHgrkTZZfaLqaonCuBp3FPtel8URjmaYkohpc6pBNt9x
	 JxAHZrqp99t1C8nv+NKmSpDQDHw4k+bvcV7N685CHoG5O7QzYfwp9fsG3czCxtDc3SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025281;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=TZSD5QmKH025pA2mThB7Vd1nrJizKgU+p5YfnwSjXP0=;
	b=AvroSPJRs6yPw18CiBi6iSCGjtY8nHV0ta70oj3PX85qrh2FAZovcYTCA1xLcl7PqofR
	 7grbHoFfgftt5LsGf44HF0KIBh2FyXI38jjtyJky5qhP2LjMJ0l5d0scd/RWSSae+ef/X
	 WrjvzqJIUXTnn9oX+lM1cuwaE99ctMNR2Zkl+o8nL2LMBf/x61ZghR/fGDMm10zLowLqt
	 HvR/R4RvjcHO/ZjZow9ujaSm1fU1OQk69N/H7prOh0BiJx0iTn42qx9vW/6/Wf3twnZNX
	 bjY7ux4aeffYtHdyqQFnjZ523GeIA2vzY+rW22LIP1SFjdX2a86bpepujeGD4MwyZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WLfV9TKx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D032606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WLfV9TKx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD551F01825;
	Mon, 26 Oct 2026 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793025280;
	bh=TZSD5QmKH025pA2mThB7Vd1nrJizKgU+p5YfnwSjXP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WLfV9TKxd4+pwBvDUJrDo0FbfDGHrrMwG5WXIJfBu6IwkUFArzaCc2I1IFwH4mcda
	 PhmvnBdA2bCSnElfQh+IDYf3xZSBq6cBF2cKUnX0jZ/N2AEf3P391XrccXbmW/PGUh
	 vaT185dD1jXaMkku1sN4XwO1h8OamI+7FtJNporo=
Date: Mon, 26 Oct 2026 15:34:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?7ISx67OR7LCs?= <tjdqudcks0424@naver.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usbip: vudc: reject submits after endpoint state
 changes
Message-ID: <2026102619-hurricane-fretful-747b@gregkh>
References: <20261020181832.461892-1-tjdqudcks0424@naver.com>
 <572df927-cb52-4504-a663-e73c68592c97@linuxfoundation.org>
 <42c043b49ccc62a79522eb2feed37b@cweb007.nm>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42c043b49ccc62a79522eb2feed37b@cweb007.nm>

On Mon, Oct 26, 2026 at 10:21:07PM +0900, 성병찬 wrote:
> Hi Shuah,
> 
> Yes, I reproduced it. Sorry, the commit message did not describe the
> test harness and the synchronization clearly enough.

There is no context here, please do not top-post and always properly
quote the email you are responding to.

thanks,

greg k-h
