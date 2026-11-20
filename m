Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182095;
	b=sDyDR8AkVj7LVjqM+qFkSMEB+dfOWSfjIhnCD+BabMJjmyYRearG5ilUXa4eq3Cm1w1c
	 nvA4nn8kCyBR9+PhA8ffjqSO1BUf3CDhnL1l9UaiV5nbKfVaeET80POZFAn89cOwCsJUf
	 YBX8g0CVhJpKcTfeSh0eTTSGfnBm0iHyc5Q482TK9u5YtyfopxAeODYMg4d5neE+2LwOz
	 t/Mr5R5gW2F44JiV9/Mx5w8D6k4+k3Wzo7G0dYDmM2wTzTJ5Whmy8j5PXsE0pqFAIPjL4
	 sw4eNuPnM/0ANAUys2BqjNDOK4A20rvK2I1AV8FWYGVw6ERqscILZ+/Zk6iRVtiyrmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182095;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RDr+Skcvkp+VdVnOX2xYSiuC83H7tWkbz5krUUmP7rk=;
	b=gWznaVk3o2h01bKStmja5bhRd+Vv9dOxVB34/fQr7yKi5daU5CpVTy2Z2t1yAwCZKmvN
	 XGcOtc1SaguuGkmYm/96UhcFD1c9ui4myyik9Zzg5ihgdMkUvoS8UPsFsMc9rPS8CDvmq
	 rfz6ZzsIlPw67v1rTKRxUHWDV0tpDNAkedsa4O6aizR7cuUSfXQ0PjeC2LnHCM7hCU6EB
	 xJ/OjRpdNPlx5J1nDyKiCZLOLMp6GHJr3xemF1p8LpE3zq1NUT4elQ5rhpA9ffB450ZUm
	 0RbWInPPZdw0qRIuLZ50OlqlKVq8Qk6R79rjcNJ9ouzzpuxgN48XbArPCROxP0hVWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="yg+/EFif";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DAE606A320;
	Fri, 20 Nov 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yg+/EFif
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BAC1F000EB;
	Fri, 20 Nov 2026 13:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795182094;
	bh=RDr+Skcvkp+VdVnOX2xYSiuC83H7tWkbz5krUUmP7rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yg+/EFifPAgwn4CYpIOXv101PJT3EgZdIGS7+/W+8yD8nOpPCYgZkQGoKXvLP0tmr
	 iEAnbttCPCe35X5OM9/xzGRoUKJ118QE2WQifIZ85X+LTK18AoXDqzc3wGzwHj3AJn
	 LdiyjH+wRHZyU9DCnbf8S9q5H4vYZqk68eO5fAWM=
Date: Fri, 20 Nov 2026 14:41:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] usb: typec: Add onsemi FUSB15201 support
Message-ID: <2026112009-pang-unfounded-0aa9@gregkh>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
 <rscry5clkcrwhqaz4hzwzqyg5ijujntv5vcajjqnq5ghbb7f5v@rkvbszy66g77>
 <w22jphnqpinyxxycjsquculr35njviv222epkn5s6vhdyx6ux5@z3ywjslfixhv>
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
In-Reply-To: <w22jphnqpinyxxycjsquculr35njviv222epkn5s6vhdyx6ux5@z3ywjslfixhv>

On Fri, Nov 20, 2026 at 01:43:19PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 12, 2026 at 10:01:05AM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 03, 2026 at 12:18:04PM +0800, Shawn Guo wrote:
> > > The series adds a driver/binding for onsemi FUSB15201 which can be found
> > > on Qualcomm Nord reference design boards as a dual-port USB Type-C
> > > controller.
> > > 
> > > Changes for v5:
> > > - Hold chip->lock while seeding the initial port state in
> > >   fusb15201_hw_init(), so a data_role or power_role write arriving
> > >   while the port is being registered cannot fail with -ENOTCONN. (Sashiko)
> > > - Link to v4: https://lore.kernel.org/all/20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com/
> > >
> > 
> > Hi Greg!
> > 
> > Gentle ping. This has been on the list for a long time, has all the tags
> > and no sashiko comments. Could you please queue this for v7.5? It's
> > blocking the DT changes with USB support for Qualcomm Nord.
> >
> 
> Hi Greg. Another friendly ping. Is there anything I can do to move this
> forward?

I'm 2000 patches done out of 5000+ that I have to review for usb stuff
right now, getting closer....
