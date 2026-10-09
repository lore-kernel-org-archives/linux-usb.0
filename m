Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF86238150
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513655; cv=none; b=RgQ/SomV2VD7EweP3Q2D/xVo5l2ryWi384n1ZMw0/mIY82YWi0sa4Q2qbql4xFYohoiQT9rcEaNjpFzS9q5rb2mUL3tWCzhkhQfvnpG5MSamMlUtSyB0QZLrLOofnxVzWmogGW3DcMr1HlKs38+GtWAOrfajo88lT5iWwvdCM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513655; c=relaxed/simple;
	bh=t3YlafWr1SlDS/aVRT+Oh0oX9kedWLVnAi0UCAFiTB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A62y5vpabx4zKwbUdeWqfbVnmQHKTJPTDr9Sa8/QKclyqcmxvJAj7n6D6LLYZv2ynMso1q6VBJcf9gxV6F6hN/7dxv6wfy6CSWS/JB3o07JoaFnQma2MetaxUXBuIMgsoRVUtJi8dPyn2Li0IcLhxhNIa7RL6qNfZQVToenLS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l08jL6u/; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l08jL6u/"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3516c82e96cso4223200eec.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791513653; x=1792118453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys5AkoGHO+1zeYlBeqQfwpPRvZXflN1giC3pkuSBrsc=;
        b=l08jL6u/UB5CK6VAjEWts4uNebuxwgJIZX+0hbCBm+n0UHtfMgLxNFgMiZexmNpXSW
         oQrcVhvutIYSR3Ar1qV48y0NCWLQluCbyb5pvOWzeS18l93IgmI1rHFWqAv0FFO1fdCQ
         6Xp1xya7CBrE9KHx27FasPBHdys9Q874RnKc7gaMcxoHLrUFIIOZTn8CnvH6xAEt3pwx
         KYNqXSokCEDAs8mK8zV2a6HWDAF9WHmIpfC8L8k5SrZxV0ipFVbZPuzaQY00yzYvkat6
         v94i+3WaRAgG/yHNPI9YqFA68yGcjpvuKhJgOzhKKrFHnfo67s3l7FYJu47FpwgnCz53
         FGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513653; x=1792118453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ys5AkoGHO+1zeYlBeqQfwpPRvZXflN1giC3pkuSBrsc=;
        b=BBBRnvcaS12tpy2e78Akwd++ztAdz12qTeReRvUfXsKB9Ew65UdH4TkHKwK2aaYpjP
         tf8wc2Sow7e87YEkIGx4lRaXHJI5rm6whmec5DcRiCCA5/SVnRz3RYEdXBHHDnVwck1B
         ONKBpr6eAEovp8lNkJQybYTH8PtyuNPnYaJ33AmNMusZ28GqK9L4hg0sqlt0Pi/rrvZI
         pv+aBkJN9x1IC5c+tzxOzYOcyXD5sF5FU9eXdibwGPOF/ASZMj8GduCJncx4uLClWF2g
         jUDyJOTd6EVbkuTHwO96++tSiWgFc+3AX/Z0NAbyYyxecXhFuMkIFo9hpGTzRxFoi9zH
         B3ow==
X-Forwarded-Encrypted: i=1; AKwUvBy2bAEp/aheO+0rf74s4X3jRYYtD9VkZ5DaH3ytwLy0XzfUrQwZbG/L2K6VpiMP4c1aAhZf8YqlXA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPb36y7iEMeRtJmZ7AqGqh0NYjRNZ80T9XubX2pRXcWQtqNm7k
	9c090Xx7sXGwmqBX0JAjD1TYWHtg2mcITS3BmzaNayyZ7WUWsnm8btiW
X-Gm-Gg: AYBFou12Ec4Bd6L0zUbvuJ8Yb8gNGuAJzGcWClt1QB5A6V52nPANelHrv+ZIkks7r8O
	vKyzXxDjwU2N6+0Wchi8D0zPsryCmHb1La7r028B5RgsNFlbr4raRZYbwjNDzn428AizS5D4HX2
	n0VOUmBLRDV1WAeyzNEeyvVwXi1hhqMlFKv+6tKSZYJDvYcXiMD8rjtBmBkx0svdeIbArLHRqek
	/0bmMMf+TCL1BrJVHioIVfeGNl7ZTf4ZCNl29n+S/45wZcg6W7i5ZmQpsPTdtKdSwIUpubn1wa6
	qa4ulqBiwWkXnbcDP59yyX6tyb8+GNfa/YBlXxj6wGWcADt+EKwlL3oqPeiJDpssjV6GZHr4pEk
	F41dx0vIFI2fgYMSAmhulhMVkwNsUDeSaMsQYHC31NrjwZmbypleAj34B18c7FI+urLYheG7lBt
	L/Wktww2alHTMixzZ9XYsc0S+3PH1R2WTOsjRg2pCmyYfl45ITI17egUkbzwzIQQQB0QHEHsErL
	vmSFP089RpViqcWn30=
X-Received: by 2002:a05:693c:415c:10b0:351:1133:8780 with SMTP id 5a478bee46e88-3537dfd18cfmr1128625eec.25.1791513653255;
        Thu, 08 Oct 2026 19:40:53 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm2228774eec.26.2026.10.08.19.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:40:52 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: helgaas@kernel.org
Cc: bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de
Subject: Re: [PATCH v2 0/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Thu,  8 Oct 2026 23:40:38 -0300
Message-ID: <20261009024038.14888-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008223411.GA935963@bhelgaas>
References: <20261008223411.GA935963@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Thanks for reviewing the series.

On Thu, Oct 08, 2026 at 05:34:11PM -0500, Bjorn Helgaas wrote:
> If it would be safe to apply patches 2 and 3 without patch 1, I could
> go ahead and do that.
>
> Patch 2 returns errors from pci_save_state() in more cases, but
> hcd_pci_suspend_noirq() doesn't check for errors anyway, so I think
> it's would be no worse off it we applied patch 2 without patch 1.

I tested that combination on the MacBookPro14,3: patch 2 as you suggest
in your other reply, patch 1 disabled, the Alpine Ridge quirk applied,
and nothing plugged into one of the two Thunderbolt controllers.  The
system resumed normally.  The only difference was this warning, once
per boot:

  xhci_hcd 0000:07:00.0: Unable to change power state from D0 to D3hot, device inaccessible
  xhci_hcd 0000:07:00.0: PCI PM: State of device not saved by hcd_pci_suspend_noirq+0x0/0x1c0
  WARNING: CPU: 2 PID: 4344 at drivers/pci/pci-driver.c:888 pci_pm_suspend_noirq+0x2f4/0x300

hcd_pci_suspend_noirq() goes on to pci_prepare_to_sleep(), which fails
on the inaccessible controller and leaves it marked D3cold, and
pci_pm_suspend_noirq() then warns.  With patch 1 there is no warning.

So 2 and 3 can go in first, with patch 1 following through your tree
with an ack from Alan or Greg, or through the USB tree.  Patch 1 builds
on its own and has no effect in practice until patch 2 is in.

I'll send a v3 with your changes to patch 2.

Francisco
