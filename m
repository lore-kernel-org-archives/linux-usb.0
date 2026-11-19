Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126749;
	b=qlkFOAJm5BUKArRgmQ5IkW4fIIGdEDTRLJ1DztUVqVZ3edClCjPQ+iwDKdCAAxdE8Xsw
	 0RSYT0oN3fEpuY78K2H/wah3IJM6y93K9D3p0wobCJ5gTNhVMj5SgpQ3OhL2WV7O+g5rN
	 TFDEHWDKEuuvPPZ3oVSlhguWJnFUr1uVde0o+H+osq/3vVDJBkeM1RRrq4e42oky67aeO
	 ukFRHZDQANVaokrepKtfJHUrko8og7ut5K+Wzve56SLMOUD2Jro2FFD/wYdbz6Qxkj4Z0
	 DDPQ9bke4m97tVKLdo/XoAcoHl6mN0a/9A3uNaJE1U3J2gN35NONz7tXlcmjCUusICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126749;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mQFnDhlAQPSGFkMT4kocQnyd56rj4zvsNyVWUnTJIuI=;
	b=ZqQYKtQT7wZv7xPNI3mYX+8BCgrWET5EM4tzQC9Jh0kNye0NffRjM9P7O5vBvOlW1zYn
	 GIYD6BtUnHR/yfwfW4RHy9gEeC3S4p3PUiblzubP45AgOHDp5sbZO8x8X52I7e9jljO0M
	 iBRzygTSiRRLXxkuxcl17HN7MDbG6DuOPoxlo1g9VTt8XaLTZUD9gSYw7sES1aXxq+cgy
	 LVbYTonAkY3n9N5ni5R03gZ6dr0CN8gXfEaASoY2kkmbjZFOkQN4mTG54m9u04g7nglu7
	 E3helEe1DEhyT8t61eh4cf62OpH6KDz99aNnP1Z15LW8pIRosWkoyK0f8/WXMCJ+b9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLMVtv+u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF619606A325;
	Thu, 19 Nov 2026 22:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLMVtv+u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EED21F000C4;
	Thu, 19 Nov 2026 22:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126749;
	bh=mQFnDhlAQPSGFkMT4kocQnyd56rj4zvsNyVWUnTJIuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YLMVtv+ut4AQF4gnI+7xG2+/PMjopRjeBDqvngspHjiV8VzVO6KflG12UD+67gA/t
	 qglGcZqHa5NOV9ycgg10AvVLkVSOiNbLUBW8xq2d57a00pocNQQhqv1Nl80poJYl1A
	 52R8f6Ubu++nmqG/lk4mjLjPsx4hNnMiF6v2UcVKtwiVgq0r4+UP8RQy1U5boA2shf
	 Xvc7AMkgZ4mT04nZuOKvtywgZOaJiFmNM64xfQzU8B//Lp1mSSW4EpFUxK1vjVdG+5
	 m58Phbu31YdBqLSjPep5BaaRt8/hqAwe5EZiB5VrOVU8VekGVeGD1MIAoZvcQUJMvu
	 9bmhAHIGbPVtg==
Date: Thu, 19 Nov 2026 16:19:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, michal.simek@amd.com, saravanak@kernel.org,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: host: ehci-xilinx-of: remove the driver
Message-ID: <179512674674.960974.10790792487176520785.robh@kernel.org>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
 <20261106051820.3414532-2-radhey.shyam.pandey@amd.com>
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
In-Reply-To: <20261106051820.3414532-2-radhey.shyam.pandey@amd.com>


On Fri, 06 Nov 2026 10:48:18 +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
> 
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
> 
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string and no defconfig enables CONFIG_XPS_USB_HCD_XILINX.
> The compatible was never documented in a schema binding.
> 
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
> 
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - Add Alan and Michal acked /reviewed tags.
> ---
>  drivers/usb/host/Kconfig          |  11 --
>  drivers/usb/host/ehci-hcd.c       |   7 -
>  drivers/usb/host/ehci-xilinx-of.c | 229 ------------------------------
>  scripts/dtc/dt_to_config          |   8 +-
>  4 files changed, 2 insertions(+), 253 deletions(-)
>  delete mode 100644 drivers/usb/host/ehci-xilinx-of.c
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

