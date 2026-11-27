Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777723;
	b=V74TcZq6PsAp3nWNNDrd71XK3+HGk4nX28ea3GA0N2+ErhU60ARcwBzkHFVMt65NhqiF
	 7eN7C5ZDZQ4Ar6c0MO9G4tMy1sUEz3CP2BKkYaWKXTUaCKOXfn3WqVfrGmADDAmLiXi8I
	 t+JgzE7BOm5Lwz7niIY8VcffdswI/nw4VRi+fde7nnwuGVlTx5kV7lUuSF983oLXarBkE
	 +EMjn5Ar9SlHkngmtQpGplDkiEW1qbrbti4zwgbcxugbxYkHfXZAg0txGZFGfmc671fCZ
	 MdZRi21VtkZ1BLbhT8LhQS6zHGMJE4SabFd3dJ2F8sMKNyJ4y0Rwx6AydVvgV+gVErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777723;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8L3jQVmqfrwl5dRjpZxBr0Qdn/uFdvrHm+6t1aPPGh0=;
	b=1tgHybY79kgpVBychHg06bFr+8OGHIwxwfXklYxCFj5iuI/otjj1Tp/O/x/YF8Hq0qvp
	 +63lRprTvzhhefXP2guB+VbIwSx6LEE8sNXm/CTQFSiJITubNGYhQPVXQAk4a86tqzLp7
	 Xl9jZHFl+BVM6EGGhkeFCVajyT1onlcqBqyKYxFU8IPJYur9UXR006HzBMGL35jP1adk/
	 EtstWxSn6W5Q4cJ1xcPzhSR+TGheudPqaBKUpqzYohjxzFp2yVFKTKbLpO6asGOJLCKIW
	 8F/ZMUFT3aaqZWY+bsC52+CC+i0wwZqdm2hJ106NsEABfl0WoNkOfdJvSiRfDWHgUKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Vg0hwG3T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B863D606A31C;
	Fri, 27 Nov 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Vg0hwG3T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49E51F000C1;
	Fri, 27 Nov 2026 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795777723;
	bh=8L3jQVmqfrwl5dRjpZxBr0Qdn/uFdvrHm+6t1aPPGh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vg0hwG3TAiCpG1Ib4yeiPFSLI5rKynIxAIJoXPqtmnyBIutOl7LoDhF96sAxvhHUi
	 3W6Zy7d+l7NKgl4InsU+WzYnp14NyeoPVvzOP6Yk9UXhPVrERScIJs+mcuBIACZDVo
	 RmurHkBn8AtHcNle1ZEjqp1z1z8mHQTeQ9Y1greo=
Date: Fri, 27 Nov 2026 12:09:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.4-rc5
Message-ID: <2026112752-syndrome-nearness-e406@gregkh>
References: <awlPtNqbTB-dyXBI@hovoldconsulting.com>
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
In-Reply-To: <awlPtNqbTB-dyXBI@hovoldconsulting.com>

On Fri, Nov 27, 2026 at 10:39:00AM +0100, Johan Hovold wrote:
> The following changes since commit f11fe7603df07fbb9fa02b0d385c1696c87a6dab:
> 
>   Merge tag 'usb-7.3-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb (2026-11-16 07:55:02 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.4-rc5

Pulled and pushed out, thanks.

greg k-h
