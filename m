Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760645;
	b=3gnpgeo4BlExX7sRcRB4ZcH2SfvQUJpYTv3K3K0H0bqlsVS8FAy1cyIAA0OCFw1S8GdZ
	 Dx5HM21dw78Jju6cWNxgBKizAwlVUv0HvXetfIEqIDT8eeY9+PbCp7QOvMidzmlEPVkBw
	 csuDDJ9/6aEXFtQtk6u+08mAhXqCcW0CcoyPxXPtybomk8TYhu+aVabSlGMwfWYurWym9
	 xplOHPLrWtyXMKaFG9AXUNFyIg2iVaYA7aM39+wHhaKaRbTrggM0cSqjVni5K76KZUb4b
	 WpUaYOWBZieiUX5yFdvm0QalE3Zt5kDbA3obuLHMddD7QyolJGzYmIOcWlZxZIzb7qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/9TYoue951zik+HLDn2qBXp3ej+wU6PZVq7TvgCLbEQ=;
	b=FulgmzqyshxEFOuMcpUHHGexXHMe2a1Rec5WWASCg4TLU+eiOZA30iOgTja297fW48ZM
	 7VomLkZujvrsSDTHa3BRMt5q4QcJjM1KgDFxABSuAGdb6X7rekkorN65pIX/zsY4Ab+Vk
	 1SAgjhuAoPC2xrhwUxhk3ZbgPhceqCdTWXZt0GO45DeYTp5ie15nnpPTgmBOdsMomIMGp
	 8yxGlydNYEuNAiIe3ltc2FyAISv/hdfYnwKdh646SHf0rvnqYI4w3GvSWS6DJkZwZRjph
	 h+afWYZGJ1N/gMzPdqc5rMge5n4lLOmYIZ8OhDFVhTDoijHNHw9JthWnre7/lcFReqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAtgVZwo;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE406606A323
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 16:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE406606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAtgVZwo
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso1564272eec.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760644; x=1795365444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9TYoue951zik+HLDn2qBXp3ej+wU6PZVq7TvgCLbEQ=;
        b=uAtgVZwojQJCinEpTZQYUXgjae1maAfkSWGFQ5hHxgVKonuy6Rb6f27MKHYs0XuYsA
         Z4Qrrh0bUbJOIN3pUukFqxgT6GIIVdTYX4iwiYffxJ5Z+Annvwws1fia06BjzULhwHv9
         jRq/LmcE5l8i0DY8xdsm3wsMgoDI0KwYqiQcD3/h5yuMMV+P47FIvVA3i9OFjiqAVb8E
         IWjf8N0ZyNfey+MS0UCwySZLL64MWnAfwp3JSsWfsNBCOxAhkTlDnRycvksAAAmLlqDl
         iNFYt9TgF6PzgI94YIVbnJ6VijWtiMZzG3E4zOafTybEJZjPWBWOA2s1rPSHXO/QgVtR
         sF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760644; x=1795365444;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9TYoue951zik+HLDn2qBXp3ej+wU6PZVq7TvgCLbEQ=;
        b=e29K0W+XyPLoY+8KNWtabKaIpERXyf55ByiTFoS50NKB4NdO7xJ/iFkKjH5p+0E6lt
         X3k79QOVMbCplgzifXQwYnEl8VNlNo0YO9Tynz/ETpo8QmrWwBfH71Zu1mW/MXnux34O
         RWikr8uXj0PqsqEP1psXyIoBEHfPAAk6huasqIqC3mJO0+ZnSt86bPKbIA+rUJKGSs4T
         b1waBorTIKm9nt4hNfw8rKYbzhch98HV7h+oV+gZ5dr4PPLx5SiqvTG35YqkAPoac7eK
         rz+5EHLIXLjROwBPBKjipX/qBdPbtHU0pnXtom+UHUPfonZbjg4pahCox1YfhimxaHYD
         IjBA==
X-Forwarded-Encrypted: i=1; AL+hErFrslOd+O/nnSE5DzlUAW3hIOOFwI0hgKI3H79DY0bTh1/aEYojR7xE6/eRwgIv/ArqeEwr4L1iDmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z87kZ065V/bz9HzbM5vUPBgMhm5pFHu2mnMoNsggAcOIS7GB2PP
	eZ8+lZTZOdJKaWlAEfsFkUqyyahoPTHiOAuremv/KQ3UFK1ixk5d3DM8
X-Gm-Gg: AYBFou3bxbsAUKiRs6nhr1LXxDoDZbRHOpOzKtbN6pSEcPtydCvshcqSxT17ruYZ5Wa
	pJcQV62BwEmBwlyV12Ga/u/dFtW6YJwwhJ/wdH5vo08azMdPTWhcVzZWl8g0v25Gtr6LdadFnUr
	kWN15q1WguIinnMaLldbeKfBOSeRfy9GwPmYpLO1rDjmD6UQod8lP4h5Gl5SDZsVYZM+UT9ase2
	cHm2ozaYQxexzD5U5zVaG6CMYnHkQVR8UauJecdT/D1OSl/IvpuiYVBN9PoRa3IBOKvJjyhmLU0
	yE2I9bDAKib2WZCJq0N2R1zFFLTjKhIpothsJj2Qk9qVPbkpoqCTiisTKrDXFTvP4O/BqBna9Rb
	8HTYuc0vVvgvVrMLF1L7NVQFnYP7tDkY1LIJec+ppuNKixIrCX/r9jJRFtrCjcP2KfGggyXowND
	aUJKQYM00E3F6q462+Xwkbxwxvv4R0uDDUDn+PNXy94QcMzwaTvqXUl5sqa3XexD/Fm18aO3Dvv
	AJYsXFuMaOsvCI2k0Ro89Rbz31bO0IRCdrlT0S7UFWkUBNEYtxtu7ldrQRv0wUgifF6wiCC7oIb
	c+TUDl3ItWetxJ0lXdFQaL3ttOzV8PuNQwqcPpkKG6Hi52uCe0y0jwPR0PI6ucTaR3hM
X-Received: by 2002:a05:7301:6185:20b0:372:601a:6278 with SMTP id 5a478bee46e88-37967027be8mr8454445eec.33.1794760643686;
        Sun, 15 Nov 2026 08:37:23 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm52062445eec.20.2026.11.15.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:23 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: failed altsetting restore leaves xHCI ep with a NULL ring
Date: Sun, 15 Nov 2026 08:37:16 -0800
Message-Id: <20261115163716.226763-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg, Mathias,

This one is from reading the code only; I could not reproduce it. It
needs SET_INTERFACE to fail and then the restore of the old altsetting
to fail too, on xHCI, so it is very unlikely in practice.

I know the kerneldoc of usb_set_interface() says that after a failure
the original altsetting may be disabled and drivers cannot rely on any
altsetting being in effect. My concern is only that a later usbfs
ioctl can still reach the HCD with that endpoint and oops.

The sequence, as I read it in next-20261113:

1. usb_set_interface() calls usb_disable_interface(dev, iface, false)
   and then usb_hcd_alloc_bandwidth() for the new altsetting. On xHCI,
   xhci_check_bandwidth() frees the rings of the old endpoints that
   are not reused. xhci_drop_endpoint() does not clear their hcpriv.

2. SET_INTERFACE fails, and the restore call
   usb_hcd_alloc_bandwidth(dev, NULL, alt, iface->cur_altsetting)
   fails too, for example on a ring allocation failure. Its result is
   ignored, and cur_altsetting still points at the old altsetting.

3. USBDEVFS_RESETEP on a bulk or interrupt endpoint of that old
   altsetting passes findintfep() and checkintf(). usb_reset_endpoint()
   still finds the endpoint, because usb_disable_endpoint() with
   reset_hardware=false keeps dev->ep_in/out[], and nothing checks
   ep->enabled.

4. xhci_endpoint_reset() sees a non-NULL hcpriv, passes its other
   checks, and reaches list_empty(&ep->ring->td_list) with a NULL
   ring.

Either side could avoid it: usb_set_interface() could check the
restore result and disable the interface with reset_hardware=true,
or xhci_endpoint_reset() could return early when ep->ring is NULL.
I have a draft of the first, but it is only tested on the normal
altsetting paths, not on this failure. Please tell me if you think it
is worth fixing and where.

Thanks,
Cheng Yongkang
