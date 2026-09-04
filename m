Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CAC35C687
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540266; cv=none; b=CsOWjbRDOhrV3rWBV1Oj3K0qzUgYPDp/N/W3Z5LRGv5jIzM1eqY5MiJkFSZZQUelONe3GTb6RblQsR2OIDV3BQlXgXiNVubYMl3tA0RAgU2QxSPOjRo+bhRackbx2LNvDtogsxIm6hTIgy6kWg9hvtMnTTqGviWhS1nNBQI7Bxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540266; c=relaxed/simple;
	bh=zuOhkEhl9/3hyPjwkXOeT9Ut7Y3NkxiWsPCsZKsgbNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+A0Xf8IgHE5sqkH/uUpOGcGy6Vtkpog2E3Gw6pmRiMXixLVrKKfJ46STdwqzKTnDaynAInhIhNw5vI49paAxVENZHy/V6/EbkDUrANOStEFE54BebfW5n5y+2+BGqk5UYCjFYpf1mjQ7ld02udZUZ07iz3wzLUat599xDcgm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lkplYKnu; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lkplYKnu"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9103228ef53so13527406d6.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540263; x=1789145063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=lkplYKnuLx52STNBRE9/OmlWQ/WfYs+lwfMhZ000DoGGVaVdCgDiuDXUS/1p6Ruc9b
         2KGIuOHOp9dmFNj5tCeJ3yrQuTGCqe/vUECH0bhV9EDuZt82XUxU51E8QjSNL9E+My+J
         atNG2VhcgWGy3HUdVYpyePtJbA/G3T4Q93TvB8aC09O3Vj7NODxXvte1l+BOU4sUvEve
         grRdxqU9xVVfeQ3EcGGQQEx3qX2U9ywwIAHn81+UP46ynR1JPXIwrDnekXGEt4+MDcIR
         YI6GlKskDu9ShKEpLxWQKK8uJgn9kB32lvhylpkFZkAFM54XF5nUQSnO58yPxGO9Uxah
         iyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540263; x=1789145063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=YtWu+6FCG8BUfgTddb+BEk/3NTTDeN27W8PqOYE2IZowr1GF7POm1psJTzS4CRPMwz
         BdBCkoC+DIwRzqN40u59cCEwtylHOISWLk1tK5kdbBq+WrnI8QK1VPnQvojhTS9l0g1u
         RMB2aXYwFx/N69yuLUl5/xNQDrSTjcTObQjZwRDippa9BkchfP7x6IRYyDUzsYwCahi4
         Oz6kj83ZNd2An0/whGe3fhHmVePMVM1akyS8ZY0ZWhY/D+nAfyB84DCAMaKH2p0C/HH9
         c01xKKAH9CO3jC8ga6YKSlV4l54lxDbSpyKTni1TJoDjoRylF+ylJmVyBLV+QkjCHMvY
         dZQA==
X-Forwarded-Encrypted: i=1; AKwUvBwYSWAQdweVny6mNvo4eBarIBioIj5/Ud6dZ+vztm1JsXu9pQcCJ2uULY7BUnD71KRwk4c7wpv8n1M=@vger.kernel.org
X-Gm-Message-State: AFuF++kVUMBTYLtIX5fYk53Cv6OrZj/KJxwKQxRFFXLEo4RfXQGxT2Fl
	uzgm8/h1Glb+G8E9ml3TMXUfidA8PxMAvyGxUu+Zskc4+ax/ZCw5pBGq4DBo738Ntw==
X-Gm-Gg: AYBFou09XQ5d+Bl+ScGUxn919hvz9PRhdG9igCbi27NjoJIPdkXipVd60eIoWgWtd8f
	38xtkW9iDvtq34A5h88mGgL2VaknA34ebdRHuFbWDiHKCqB5ppqh78C48o2w9jBumtw9+vPkpjS
	vFsbqiMtgUSLga8+kw8VI2E8SbtabSEEcDJjf+/hb7o33VNQ3NUiG2A26CWqbw3Ed1nA4cazzEQ
	VSnZwYWz6xZMgLHN73dS4DTgZeHveWDczdPsLwBXZR7XEHlbxEFAOfXBZJ1aeqL2+Tr0Qc6H2Jh
	Hxld/BkcI1nr6Tyh8Xzr90EjBwUXoOBlk34gtYxSmNERiwzZuLztm3qYP9s/pQrQoSBI0EsHxaj
	t2kXAneAFhiL8hoYIjcZAwSqXvpLMc82k8CQOvUdRT6NL7tvlvHojSuLQDslH6zrAUwK3ncIPd5
	l2Nl/Dgz4ebC7kgj9uglDTcwlJfNEGoR+/1wI2CVXSCyT3waNSc9zBfL0zay5KEA==
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr78478096d6.31.1788540263010;
        Fri, 04 Sep 2026 09:44:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm24672736d6.14.2026.09.04.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:44:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:44:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <c3740c4f-6ae8-4c6e-8f80-105f1607ef55@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-9-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:47PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Minor complaint (not referring to anything you're doing here): 
port->is_superspeed really should have a better name, more like

	port->is_superspeed_capable

or

	port->is_usb3.

As it stands, the name is ambiguous.  It might refer to the speed of 
devices that the port could connect to, or it might refer to the speed 
of the device the port is currently connected to.

Alan Stern
