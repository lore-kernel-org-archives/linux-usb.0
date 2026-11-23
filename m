Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422039;
	b=z9NiaScHHFA4Ltz3r2bngDuh7L+SG5JvYI45tdk/SsAosGQXHkvbvhZ/fOD6SQyxuzqR
	 CiZ7YI2O+7TIBUUGNaP9ujFPyOREE9+dKD30uuglrlsVKGOIzyKVXtwKvg4FbIVMcGr8c
	 CZ6cCto9TRnb66GviuE2irmg1gL4DBLhvd390QTQF3/dRk/gyqQkD9dV6DWorrQ/EfHS6
	 2uBHTM3/G1VNjmu7Z4wzVcCx2Ex7Lmw1eBXD1h0YusdFa3Ax1mTkhPrCsHGrjpysUwbWo
	 Wt3tb82p6824EFcxsWO9L1ZUdWvP7XreygLdRO13CeOcEIBWEhRhZBODc0P1FTPe6Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422039;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hMB8mVGYkbYkUiCO7PHPPXPE3XB7m8R85nAtHHeNgEk=;
	b=wEw8tWxPtaOgUFeH7ns3xqOhArVlAzW6cmBV5Mm5aM+Or7UOkMriE1ohWh+i9l/wP4IO
	 rLrLX1urcnS9KW1hhV4i4ylh8HcT9av+gzTCNy760dS6YYc4k8sSfycXI/59AUoAi1QE6
	 Kt4NKmK36uvlspVqW2F9dC4MWNTTgdzB47jmViokKyz/GBbZvu1TtVykChPire9QBQQXD
	 nScCa66NUrLbSpXPbMBScxSZSYMQjEmq9BWlbo2l+Eh4wOq2aWmSc0u5Pm8DimOwiHQE6
	 jpF98f+zmx6Tbrh/McIvoVgUa9VWH0MPp4LjudIUjMfgdD/y5+D5tGW8aSpho1G467Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Gada8yR6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D1606A31A;
	Mon, 23 Nov 2026 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Gada8yR6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBBB1F000C4;
	Mon, 23 Nov 2026 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795422039;
	bh=hMB8mVGYkbYkUiCO7PHPPXPE3XB7m8R85nAtHHeNgEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gada8yR69H9OA3TpAwCI47hOJVTIHaekKqvgqEzMSgW3nKtd2To7yUt0THJxCsVsp
	 cDq66i9LoN2lsXUX3rgsV07igby8OCzuk4GVpDZTGiRtnLfRYlm0agYlhMT3l0K8S9
	 fsyaE8tzn4mYGbKJ+TOU4BX3wq8PfJZvq+cAEFIA=
Date: Mon, 23 Nov 2026 09:20:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/3] usb: dwc3: select the shared HS data bus with a
 mux controller
Message-ID: <2026112313-skied-crock-7374@gregkh>
References: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121132029.2379449-4-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261121132029.2379449-4-xiaqinghuan@mail.ustc.edu.cn>

On Sat, Nov 21, 2026 at 09:20:29PM +0800, Qianhui Xu wrote:
> Two connectors can share one High Speed D+/D- pair only if a multiplexer
> selects which receptacle drives the controller, and that selection has to
> follow the USB mode: leaving it to a board level GPIO means the controller
> can end up driving the data lines of the connector that is not in use, and
> a host or gadget instance cannot be torn down while its own lines are still
> selected.
> 
> A mux controller cannot be read back, so the connector in use at boot
> cannot be detected: the first mode request claims the mux for state 0
> instead.  A move of the data path to the other connector is a mode
> switch even when the role does not change, which is why it goes through
> the same worker.
> 
> mux_control_select() sleeps while waiting for the controller and
> mux_control_deselect() may sleep as well, so both are only called from
> __dwc3_set_mode() on system_freezable_wq and from dwc3_drd_exit() after the
> mode work has been drained; the role-switch set() callback keeps recording
> the request and never touches the mux.  The mux stays selected between
> switches, since the controller always drives exactly one of the two
> connectors, and it is deselected on unbind.  The arbitration,
> publication ordering and teardown rules of the per-connector role switches
> are unchanged.
> 
> *** AI-assistance disclosure ***
> This patch was prepared with the help of an LLM coding assistant.  The
> author reviewed every line and ran the gates quoted in the series notes.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
> 
> Changes since v10:
>  - deselect the mux in dwc3_drd_exit() after the active role has been torn
>    down instead of before: mux_control_deselect() switches the shared High
>    Speed lines back to the mux' idle state, so deselecting first cuts the
>    data path off underneath a host or gadget instance that is still
>    running.  This is the order __dwc3_set_mode() already used: role exit,
>    then the data path switch.

What about all the previous versions?  Please always include them all,
right?

thanks,

greg k-h
