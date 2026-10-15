Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A723F4DF3
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079549; cv=pass; b=K5RdNSWmFHCJ52+3qVFgpXk77KUcGsEQ+/0AB11cFwPYkRW8jEnXFmFYoiZRM4kVMMptiITib+TMePyvwaTxSFiE4UyRYPwQKzJoU5ucUIdvRydYW/8AO3Tsb/2GhzshdcxbePh9bD0MFYmnEF7KOGYI6CgsxyGGACdM3EKmbms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079549; c=relaxed/simple;
	bh=hWiUxB4D4MIW8N8kxcCWfSDn6lxEelWZrFESkG87aes=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KDLVO2iGPUL7rh0D67vhw5EJ5ooz5F92JrymXZF1yO+RWduRwUza3tqy0KXIrfgGCFj9d/7q3Vx2lNG7/EbG5Ic4Ez/S2i2walcGZaZjFhTiNBUKBuAJihWvCJ9S0cfqZMRCZSuUi18zdQxlDDC3u3/4C3bY5xbhT0jsSpSEh6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MgpY0v+f; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MgpY0v+f"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1946520d50.1
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792079536; cv=none;
        d=google.com; s=arc-20260327;
        b=bccECERsDhcGZsX6sb15/pXhtX3x/QcXYoxbfhBrT3rSrUduK5urmQ5nqZF+JU/LdQ
         /xxhnRsVlV8pE8p1FKeKplrMqSL/1PpjfaH2MjaZwm7Yxsen/hzuYXviHEHRzZNsRVxK
         hOwipQ6v6RADduSO+uZSpWBlqcTqnhroQaNMl3rqre7a00bU5Sg18u+DVD7QdCFpkjnx
         skMMwmVr1mtRlEnNCsClzLMo3n19JeRAxv4cnsoaFDwtFPS1gpLevffIPGOqiJS5VeS0
         HxEfr4gqazaW8o+7YXr4p4hxGeMPZjazPxFq9VXYTfgber/5w5h1C7HHUWccXZieenVw
         E9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=asq+PqvjvzjptU3DIDCu1R4E/CeJS68mF9uWIR6gcXI=;
        fh=iEU6a+ZC5YzxofA6hPTqP5nFXvaAGMXmJXB5PERZiEY=;
        b=BknSkST9uQzSwsWQuMPIpH00PsEKCZtjY50OH7BXfjdH3uB/0+KIMZgJMCRSJXcbkf
         J8BZQUj7ufI1stIqi0yvfC8yawSMaFlnBTwSxEjVxAJCJtAwpF+X+MysTjsIwsys+bEB
         AwSlpQUVC3aqD8t2TNUYR9RoH5kkQkwylXI1jBj3QnhSgEtuIstseT2Qw7eQUPzVxtlg
         WpQK8jKpAPB/i58rZtrUhoaORGKPop0wzw9DDtW9UPpfsYb2rK+nhhvafLmbodV6DhM5
         EFYiIZDYEXbMLkPSpPfBXlGpg90HnjK8mR2lrHfxq71HUco78eJJXpsAXZDMgTnSAkGn
         ZDpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792079536; x=1792684336; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=asq+PqvjvzjptU3DIDCu1R4E/CeJS68mF9uWIR6gcXI=;
        b=MgpY0v+fDeMRTzjI9kUQ9RKCSefKzU4mAodZEXaJ6uVv/sxEoz+ZAgI3qiFQo7OwTB
         NlCmEK2nK9Q/tV2M1kK6gGo8DgaB6VU/hJZxH4OqNTv7sojKkibWk9mYttEBrywpXj3U
         RuuDhqm9MrGAIAGV9YptD9/yt0dvDVSIc8Nkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079536; x=1792684336;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=asq+PqvjvzjptU3DIDCu1R4E/CeJS68mF9uWIR6gcXI=;
        b=p9QB9hm1dUPcRO98ZGkm9mhME+n1lCJRV0uNiywL3lrZA8mDoWd4iH5lBEJmxREiR4
         Z3P9sfD8Ko9CBFZ1c00MNsLh0uKLYZgaRdXrVjWZgbhOrnkD2M15MS7LJ/UnJ0HnBOuJ
         fyQr2+g/hsXQHqAai/ino+7kHCUqGqbqUwdExbaeMGuHkDqFWGXV4Ec9NRb2bxVmMasX
         N/2Y9jl4bj3ZZlD7a/0CMZ1EV4cQ2pyT0cL3qEjYKfgCSKJtkbgxvNARQQtAYsxzW+Ex
         pviNzoMXmNT9WIZdTCDwYx/UnxhyuZY57B4d9+83mS5rRa3DXhACXxAevAJJKwsviaHT
         2aVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSxL6/gJqZ8MbLjEKuswRGLtGyaOkvHBvRv3M96TJJbqoABmNRMeMEp6QCvqyJbPvWMiwkg/cZq0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8jcoFyJnvXu4xhaWYNrdxVHy84aZNmjm/Wr2SgYLVBwWicIJO
	I7VQ3mnfos4N78UAsjIDycX1jiVmv51k+KZlll54JyKRPIJXyzAPXppiXrd6z+vwnYIZQEiTfAd
	esNQEIj2xC58sfOm+z35TL9lujwQKQjJW0TjHWxOl
X-Gm-Gg: AYBFou0HJfk4nfc3orGtlJWNb39PgsJJ/LpekTrR9yokNIbvhmdL+hgT9YhCQng/51q
	TKH92QV9BRF3nTYIav9AABheiXGxz3MhmSIUm2WKpcz3qvj1ZDCYlC1/lYXMWakeuxefIXGCHoG
	8nkzSPZkcHggZyLUIvHRDVhWN1UFCZ0OS5hk67tRcsIAmG9DcIvH4VUZFlzwGKRdGxSNY3N8lMd
	nqJa9slb4pcbU6mBhPikqVX7uCPRTgGDxkQ8diykgOh8bSh9liNsKQ/AErSB+P5ZD3djhZmt3E1
	MRWysobR6ZaVRK+PUlVb1BBsJrQg3yEQYSjnynOypok9ik3u+TQCbQg1
X-Received: by 2002:a05:690e:4195:b0:675:40a6:144e with SMTP id
 956f58d0204a3-67936065a46mr4178517d50.69.1792079535833; Thu, 15 Oct 2026
 08:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 16 Oct 2026 00:52:04 +0900
X-Gm-Features: AclHuK_ryR54C0PAzAkbNZvfpF8K_oQY8dR3WE9tuX28J6eDhH7nVE2x5HzgOC8
Message-ID: <CAGXv+5GFRCvWf7ahXyGcQHhth2yyOfGuknV1MM5-L2HjEQ4-Ew@mail.gmail.com>
Subject: GPIO_SHARED_PROXY default m?
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I just ran into some issues with GPIO_SHARED_PROXY=m and onboard
USB hubs with shared reset GPIOs causing infinite USB hub probes.

My device has a USB 2.0/3.0 hub connected to an xHCI:

        &xhci {
                usb3_hub: usb-hub@1 {
                        compatible = "usb5e3,620";
                        reg = <1>;
                        reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
                        vdd-supply = <&pp5000_a>;
                        peer-hub = <&usb2_hub>;
                };

                usb2_hub: usb-hub@2 {
                        compatible = "usb5e3,610";
                        reg = <2>;
                        reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
                        vdd-supply = <&pp5000_a>;
                        peer-hub = <&usb3_hub>;
                };
        };

I have:

    CONFIG_USB=y
    CONFIG_USB_ONBOARD_DEV=y
    CONFIG_HAVE_SHARED_GPIOS=y
    CONFIG_GPIOLIB=y
    CONFIG_GPIO_SHARED=y
    CONFIG_GPIO_SHARED_PROXY=m

Logs show an initial enumeration, followed by deferred probes from the
onboard hub USB device driver, because its matching onboard hub platform
device driver is waiting on the shared reset GPIO proxy. And it keeps
repeating endlessly. This goes away if the proxy driver is built in.

So I wonder if having the proxy driver built as a module by default is
a good idea. The user won't see the deferred probe messages, just a
barrage of "USB hub found" messages. I didn't wait for rootfs to load
so I don't know how long that would take with the console going crazy.

I'm sure someone on a Qualcomm laptop will eventually run into this.


ChenYu


Logs:
[    4.635712] usb 1-1: New USB device found: idVendor=05e3,
idProduct=0610, bcdDevice=68.02
[    4.638954] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.639120] usb 1-1: Product: USB2.1 Hub
[    4.639213] usb 1-1: Manufacturer: GenesysLogic
[    4.646597] hub 1-1:1.0: USB hub found
[    4.647489] hub 1-1:1.0: 4 ports detected
[    4.749900] usb 2-1: new SuperSpeed USB device number 2 using xhci-mtk
[    4.762891] usb 2-1: New USB device found: idVendor=05e3,
idProduct=0620, bcdDevice=68.02
[    4.765197] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.765251] usb 2-1: Product: USB3.2 Hub
[    4.765282] usb 2-1: Manufacturer: GenesysLogic
[    4.767921] hub 2-1:1.0: USB hub found
[    4.768475] hub 2-1:1.0: 3 ports detected
[    4.959894] usb 1-1.4: new high-speed USB device number 3 using xhci-mtk
[    4.992223] onboard-usb-dev 11200000.usb:usb-hub@2: error
-EPROBE_DEFER: failed to get reset GPIO
[    5.064595] usb 1-1.4: New USB device found: idVendor=0408,
idProduct=30d1, bcdDevice=0.03
[    5.087992] usb 1-1.4: New USB device strings: Mfr=3, Product=1,
SerialNumber=2
[    5.088091] usb 1-1.4: Product: USB2.0 HD UVC WebCam
[    5.088151] usb 1-1.4: Manufacturer: Quanta
[    5.088203] usb 1-1.4: SerialNumber: 0x0001
[    5.094011] usb 1-1.4: USB disconnect, device number 3
[    5.103773] hub 1-1:1.0: USB hub found
[    5.104225] hub 1-1:1.0: 4 ports detected
[    5.200483] hub 2-1:1.0: USB hub found
[    5.201022] hub 2-1:1.0: 3 ports detected
[    5.206617] onboard-usb-dev 11200000.usb:usb-hub@2: error
-EPROBE_DEFER: failed to get reset GPIO
[    5.212594] hub 1-1:1.0: USB hub found
[    5.213080] hub 1-1:1.0: 4 ports detected
[    5.221829] hub 2-1:1.0: USB hub found
[    5.222331] hub 2-1:1.0: 3 ports detected
[    5.227388] onboard-usb-dev 11200000.usb:usb-hub@2: error
-EPROBE_DEFER: failed to get reset GPIO

and keeps on repeating.
