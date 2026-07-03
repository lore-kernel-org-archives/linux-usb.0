Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1303B27DE;
	Fri,  3 Jul 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071829; cv=none; b=X8iAGtFxHBPdQQ2ctwQ88N+5HHSYU4rW3FAAnutJXvhmY9EQiricchOSlM2iIopKBput4iyoSB54HP2AJd7OvY4Y5HNsOSxxhKuebijrbjNtTZDtdHlyy1Ipie6XuluMjVJ0EFlDs34ZS1oR1WMyae3AeJ4FI0PTKjP5588hoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071829; c=relaxed/simple;
	bh=CIZ0rnx9KnHVixPVZYj70ZfC3bulQXTewxBAvoI/jxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qhd1bK+YC/GUkZTSDFNwxO6DVhVHt7wDJSoi8XO//2+sB7BkphBCqXb2N45RHq96awzBLyMvM6OshYY//VsyJ/bESGeK7Hdevjo1LvW/AFNMSCSOMt4oPKFnwY9QV/O7vbvg2GxyRyrMJm0cUvcpxHK/plMRG2JmdIcZyvWMFT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T/ti5UMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T/ti5UMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6388D1F000E9;
	Fri,  3 Jul 2026 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783071827;
	bh=62pw+ihZmBZOUzdyJ1UjmHuGlZiSUwsGe5FedLcLNT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T/ti5UMsHClHkllOJVSuchhI45IzigbT6k+7qP6SfTMzrXi5uZ7J8IAJXbsoSbK9K
	 HLmZQYyUqfzGbwlXwpwwYcvZ2PivxOXCum0wyVmqsVihUnfpIXHkBpTDxzNEyFKqp3
	 D5dwOrghPpxGgEhiN+EcUd+7IeLbi1DHMWxAgz40=
Date: Fri, 3 Jul 2026 11:43:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kuen-Han Tsai <khtsai@google.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: hub: call ACPI _PRR reset during port power-cycle
 on enumeration failure
Message-ID: <2026070349-unwound-cavalier-fb60@gregkh>
References: <20260326011708.1128840-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326011708.1128840-1-acelan.kao@canonical.com>

On Thu, Mar 26, 2026 at 09:17:08AM +0800, Chia-Lin Kao (AceLan) wrote:
> Some USB-connected devices (e.g. MT7925 Bluetooth on Dell laptops) expose
> their hardware reset line via an ACPI Power Resource for Reset (_PRR)
> rather than relying solely on VBUS cycling for recovery.  When the reset
> GPIO gets stuck low the device stops responding on USB; a VBUS power-cycle
> alone cannot recover it because the chip remains in reset regardless of
> VBUS state.
> 
> Add usb_acpi_port_prr_reset() in usb-acpi.c that, given a hub device and
> one-based port number, looks up the port's ACPI companion handle, evaluates
> _PRR to obtain the power-resource reference, and then calls _RST on that
> reference to toggle the reset line.  The function is a no-op if the port
> has no ACPI handle or no _PRR method, so it is safe to call unconditionally
> for every port.
> 
> Wire it into hub_port_connect() during the mid-retry VBUS power-cycle
> (at (PORT_INIT_TRIES-1)/2 iterations), calling usb_acpi_port_prr_reset()
> *after* VBUS goes off and *before* VBUS comes back on.  The ordering is
> critical: on the tested hardware the ACPI _RST method (MBTR._RST) drives
> BT_RST low for 200 ms then high again.  If _RST is called after VBUS is
> already restored the GPIO pulse races with device enumeration starting on
> the live bus; the device begins asserting USB signals while still held in
> reset and enumeration fails.  Performing the reset while the port is
> de-powered ensures the GPIO pulse completes fully before the device is
> given power and time to initialise.
> 
> After VBUS is restored, add an msleep(100) conditional on _PRR._RST having
> succeeded.  USB 2.0 spec §7.1.7.3 (Fig. 7-29) mandates a minimum of 100 ms
> between VBUS power-on and the first reset signalling for power settling.
> On root hubs, hub_power_on_good_delay() returns bPwrOn2PwrGood * 2 with
> no minimum floor; on the tested xHCI root hub bPwrOn2PwrGood = 10, yielding
> only 20 ms — well below the spec minimum.  (External hubs already enforce
> a 100 ms minimum via hub_power_on_good_delay().)  When _PRR._RST has been
> exercised the device must also complete its full power-on sequence (GPIO
> de-assertion, internal oscillator start, firmware load) before USB
> enumeration begins.  The 100 ms sleep enforces the spec minimum and gives
> the device adequate settling time.
> 
> Tested on a Dell laptop with MT7925 Bluetooth (idVendor=0489,
> idProduct=e139) whose BT_RST GPIO was stuck low.  With this fix the
> device recovers autonomously at boot without requiring a G3
> (mechanical power-off) cycle.  The relevant dmesg sequence:
> 
>   [    1.448491] usb 3-10: new high-speed USB device number 4 using xhci_hcd
>   [    6.813942] usb 3-10: device descriptor read/64, error -110
>   [   22.685978] usb 3-10: device descriptor read/64, error -110
>   [   22.901715] usb 3-10: new high-speed USB device number 5 using xhci_hcd
>   [   28.317963] usb 3-10: device descriptor read/64, error -110
>   [   44.189949] usb 3-10: device descriptor read/64, error -110
>   [   44.294065] usb usb3-port10: attempt power cycle
>   [   44.872709] usb 3-10: new high-speed USB device number 6 using xhci_hcd
>   [   44.888293] usb 3-10: New USB device found, idVendor=0489, idProduct=e139, bcdDevice= 1.00
>   [   44.888318] usb 3-10: Manufacturer: MediaTek Inc.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/usb/core/hub.c      | 14 ++++++++
>  drivers/usb/core/usb-acpi.c | 68 +++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/usb.h      |  3 ++
>  3 files changed, 85 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa91..1740e96f73cc6 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5603,11 +5603,25 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
>  
>  		/* When halfway through our retry count, power-cycle the port */
>  		if (i == (PORT_INIT_TRIES - 1) / 2) {
> +			int prr_reset;
> +
>  			dev_info(&port_dev->dev, "attempt power cycle\n");
>  			usb_hub_set_port_power(hdev, hub, port1, false);
>  			msleep(2 * hub_power_on_good_delay(hub));
> +			prr_reset = usb_acpi_port_prr_reset(hdev, port1);
>  			usb_hub_set_port_power(hdev, hub, port1, true);
>  			msleep(hub_power_on_good_delay(hub));
> +			/*
> +			 * USB 2.0 spec §7.1.7.3 requires at least 100 ms
> +			 * between VBUS power-on and the first reset for power
> +			 * settling.  hub_power_on_good_delay() on an xHCI root
> +			 * hub returns bPwrOn2PwrGood * 2 with no minimum floor,
> +			 * which can be as little as 20 ms.  When _PRR _RST was
> +			 * also exercised the device must complete its power-on
> +			 * sequence before enumeration; enforce the spec minimum.
> +			 */
> +			if (prr_reset == 0)
> +				msleep(100);
>  		}
>  	}
>  	if (hub->hdev->parent ||
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 489dbdc96f94a..ee62e3fd8e3a1 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -142,6 +142,74 @@ int usb_acpi_set_power_state(struct usb_device *hdev, int index, bool enable)
>  }
>  EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
>  
> +/**
> + * usb_acpi_port_prr_reset - issue an ACPI _PRR reset on a hub port
> + * @hdev: USB device belonging to the usb hub
> + * @port1: port number (one-based)
> + *
> + * Some devices expose their hardware reset line via an ACPI Power Resource for
> + * Reset (_PRR).  When such a device fails to enumerate (e.g. because the reset
> + * GPIO is stuck low), the USB power-cycle alone is not enough; the firmware
> + * reset path must also be exercised.
> + *
> + * This function evaluates _PRR on the port's ACPI companion to obtain the
> + * power-resource reference and then calls _RST on that resource to toggle the
> + * reset line.  It is intended to be called alongside the mid-retry VBUS
> + * power-cycle already performed by hub_port_connect().
> + *
> + * Returns 0 on success, -ENODEV if the port has no ACPI handle or no _PRR
> + * method, or a negative error code on failure.
> + */
> +int usb_acpi_port_prr_reset(struct usb_device *hdev, int port1)
> +{
> +	acpi_handle port_handle;
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *pkg, *ref;
> +	acpi_status status;
> +	int ret = 0;
> +
> +	port_handle = usb_get_hub_port_acpi_handle(hdev, port1);
> +	if (!port_handle)
> +		return -ENODEV;
> +
> +	if (!acpi_has_method(port_handle, "_PRR"))
> +		return -ENODEV;
> +
> +	status = acpi_evaluate_object(port_handle, "_PRR", NULL, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		dev_dbg(&hdev->dev, "port%d: _PRR evaluation failed: %s\n",
> +			port1, acpi_format_exception(status));
> +		return -ENODEV;
> +	}
> +
> +	pkg = buffer.pointer;
> +	if (!pkg || pkg->type != ACPI_TYPE_PACKAGE || pkg->package.count < 1) {
> +		dev_dbg(&hdev->dev, "port%d: _PRR returned unexpected object\n",
> +			port1);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ref = &pkg->package.elements[0];
> +	if (ref->type != ACPI_TYPE_LOCAL_REFERENCE || !ref->reference.handle) {
> +		dev_dbg(&hdev->dev, "port%d: _PRR element is not a reference\n",
> +			port1);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	status = acpi_evaluate_object(ref->reference.handle, "_RST", NULL, NULL);
> +	if (ACPI_FAILURE(status)) {
> +		dev_dbg(&hdev->dev, "port%d: _RST evaluation failed: %s\n",
> +			port1, acpi_format_exception(status));
> +		ret = -EIO;
> +	}
> +
> +out:
> +	kfree(buffer.pointer);
> +	return ret;
> +}
> +
>  /**
>   * usb_acpi_add_usb4_devlink - add device link to USB4 Host Interface for tunneled USB3 devices
>   *
> diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> index a9b37aeb515be..4d3dc3bd881b2 100644
> --- a/drivers/usb/core/usb.h
> +++ b/drivers/usb/core/usb.h
> @@ -211,7 +211,10 @@ extern int usb_acpi_register(void);
>  extern void usb_acpi_unregister(void);
>  extern acpi_handle usb_get_hub_port_acpi_handle(struct usb_device *hdev,
>  	int port1);
> +extern int usb_acpi_port_prr_reset(struct usb_device *hdev, int port1);
>  #else
>  static inline int usb_acpi_register(void) { return 0; };
>  static inline void usb_acpi_unregister(void) { };
> +static inline int usb_acpi_port_prr_reset(struct usb_device *hdev,
> +					  int port1) { return -ENODEV; }
>  #endif
> -- 
> 2.53.0
> 
> 

Please see the review comments at:
	https://sashiko.dev/#/patchset/20260326011708.1128840-1-acelan.kao@canonical.com
