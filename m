Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6614825AE
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450414; cv=none; b=QH757EmqUl2Um1NWWQLW9kg01ekS8hYTkhUFk6GSmzbax/7+fznbsok4hFeQkAYT22gsN57XV+tFSDmhcfcOb4P5T0Q+ZpdqTCnQ6hl/uAHUxfru6MFP1n0zzIc5XT8sqvD0fE7uHsD6npC3Qihc6omPByGzKUupfMahejCGmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450414; c=relaxed/simple;
	bh=n31NPjcrNfXmoAZnoEAX3nhq9CpQ5VRu8WLGYCK4DSc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdHrLd15M51RxlpDMzmpZ182RQ4QdiZ1IjwqqLoNGOZuggy2NucwaCY+UTzoV6eVSCKbpmwneauT2nUeYt6a36HbkN9f2/UAQ8y+RPKl4WN4Y4yuR3Z5KkgvuIAiwUhwtZ0DnBSVLBWYgmi3/qNsOVIj2X+CNKlEBS6eU88q5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLKKNMlb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLKKNMlb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso1786566f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791450409; x=1792055209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nh0S80JFhUom19ehrtN1hWime/jL3Bzp9KCI/tmXU2g=;
        b=rLKKNMlbzA0439K4sl8GdwDBtj2Tl1Vm2CZ3kAIH5BwW9vT1stDv3Q2hTrN4qLi3Bt
         rOZZ9MfAMcii+c3cnZafu2nhL6IhRjMYgaAGd7ZFaILe6LArPQrhbawy6uuYY6hIhLy9
         FkOTXBeBCFZ9DlRIcS9KtP2Xwpc7p9B44Tjpcid416UGAkjwXwI+o9bpH+xxAXSIx0K8
         6qEeEwMkRttmdIUlHJv1VOLsJKxdbeU1uIXcV0+Y4IujQ4ftgDu8u4Qlfzw6HT/wrtgT
         X5Lpqi4cWw5hMcbLHx1NIwZS0IryT4WCGYlX01cY4fQeOomEwgidqEUAbbVQ4grSpEKJ
         p3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450409; x=1792055209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nh0S80JFhUom19ehrtN1hWime/jL3Bzp9KCI/tmXU2g=;
        b=Xz0lTU0ZeF2TUCToLqRkzKH9qmy9hgxAFed2XBrztRCMaZEBk8dwmJWgfEv1JDC4aV
         KYjcOgwolRPfV5eNtFj5cD7yn36Y5xY2LbGKPcPbyTV1ja0SdApLZznOxy59bfgqSsSF
         u42FqypSDQx/jxGxp72zWn4bSJkwuXrgtz2r31Xt5DximiUCxO4/uFrIfQrOgEvF00yI
         a/0kgm3dTfR270aB2sT188LSHfn5rb2fvxwmwyO3/gopk101UqEJolJZrk+uzu/oJ6mM
         g/WJvGq7SoufXm7UiGrqZ6aVd2CrT3Q8nvmbYj4rWabvfvllAVKzlR/QDgRvSy2W5ofz
         sHVw==
X-Forwarded-Encrypted: i=1; AKwUvBwHNrt+BgwMcj9afG6QVmBH5u4rCFSbemQAyoywfk+57N+HdwE/XiR1pi4PgZ97uCOdvN5YbBctNUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSTS3hPhGyTpf+2AcJqqcUXFkNb7wDYIoyyCrdF52zY+D/gjHQ
	MaKr2uB1wuK1VU8eLBlDrFp3x6DDRMzXDWK6hX7Q0pPmGTW0zwKJtgpl
X-Gm-Gg: AYBFou1VrWGSOEhozvL9aPOOjKtQMuBPZkIDdNzY8daGERfH21VqYF9gMXXrwAiPNTp
	LLG8aGgnaRl/NpEI7Dz+wni9OPXOS6R2gVoCJaMM+1l3LWYvltSLRz/OTTv0OJCxJa0P3EDxZf1
	v2GbMPzA2fd5WTBsb/8O6ouSB04g84EDM0uh7eAbj0JudPClWs1rMGTxDPKjlwq4JNcAB+bDQTU
	sDmuIAKmokvCFiCBtoOE7fHxtKOHZNcrl9BIfBmDC+TvP4toJnlskxrlCgsCN+ymVcgm2Ya7RRZ
	FvFa4+SHTxU4J4gMoyuzsoHtXTDY/Cxy6RtQxR3LDSX8cNocSwzVsswKHLP9tCowYXHQgYlw9Di
	Knub/723OAcskVH/5dkCXR7fXkmaBSHOVPsWi1UDiYvWCLKG1EjLYQQWtTxfs45nf1yMb5GpqwX
	5kcfJltzOV09UIDSvDoTTY/AlbU8UTtX0WzYlr3d8cORNSQdsa0elr93PnjQ970JpXvfyg+ZKG6
	TpHoXcneA==
X-Received: by 2002:a05:6000:24c3:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-48c7386b121mr8113599f8f.8.1791450409126;
        Thu, 08 Oct 2026 02:06:49 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1144csm9665610f8f.23.2026.10.08.02.06.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 08 Oct 2026 02:06:48 -0700 (PDT)
Date: Thu, 8 Oct 2026 11:06:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Tseng <henrytseng@qnap.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure
 endpoint hang on device disconnect
Message-ID: <20261008110642.56567a92.michal.pecio@gmail.com>
In-Reply-To: <179136673328.386669.9410030239460428155@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
	<20261002113012.271ceead.michal.pecio@gmail.com>
	<179136673328.386669.9410030239460428155@qnap.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 07 Oct 2026 17:52:13 +0800, Henry Tseng wrote:
> port_bandwidth/ is left out, since reading it takes xhci->lock and
> queues a get port bandwidth command.

Thanks for pointing it out, we do need to skip this in such cases.

> xhci_handshake() is still called with xhci->lock held and interrupts
> disabled in other places.

Yes, we know. They need to be individually fixed to drop the lock.

Your debugfs shows the following tree of devices still existing:

# USB3 hub
devices/01/name:1-1
devices/02/name:2-1

	# unknown USB3 device
	devices/04/name:2-1.3

	# another USB3 hub
	devices/06/name:2-1.4
	devices/07/name:1-1.4

		# USB3 UAS device
		devices/08/name:2-1.4.4

Event ring dump (--> shows corresponding commands):

 1 0x00000000ffffc230: TRB 00000000bb0324f0 status 'Short Packet' len 96 slot 8 ep 7 type 'Transfer Event' flags e:c
 1 0x00000000ffffc240: TRB 0000000001000000 status 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:c
 1 0x00000000ffffc250: TRB 00000000ffffe5e0 status 'Success' len 0 slot 3 ep 0 type 'Command Completion Event' flags e:c
-->  0 0x00000000ffffe5e0: Configure Endpoint Command: ctx 00000000ba6ac000 slot 3 flags d:C 
 1 0x00000000ffffc260: TRB 00000000ffffe5f0 status 'Success' len 0 slot 3 ep 0 type 'Command Completion Event' flags e:c
-->  0 0x00000000ffffe5f0: Disable Slot Command: slot 3 flags C 
 1 0x00000000ffffc270: TRB 00000000bb067000 status 'Stopped' len 1 slot 5 ep 3 type 'Transfer Event' flags e:c
 1 0x00000000ffffc280: TRB 00000000ffffe600 status 'Success' len 0 slot 5 ep 0 type 'Command Completion Event' flags e:c
-->  0 0x00000000ffffe600: Stop Ring Command: slot 5 sp 0 ep 3 flags C 
 1 0x00000000ffffc290: TRB 0000000005000000 status 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:c
 1 0x00000000ffffc2a0: TRB 00000000ffffe610 status 'Success' len 0 slot 5 ep 0 type 'Command Completion Event' flags e:c
-->  0 0x00000000ffffe610: Configure Endpoint Command: ctx 00000000bb025000 slot 5 flags d:C 
 1 0x00000000ffffc2b0: TRB 00000000bb030000 status 'Stopped' len 2 slot 4 ep 7 type 'Transfer Event' flags e:c
 1 0x00000000ffffc2c0: TRB 00000000ffffe620 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:c
-->  0 0x00000000ffffe620: Stop Ring Command: slot 4 sp 0 ep 7 flags C 
 1 0x00000000ffffc2d0: TRB 00000000fd0c7000 status 'USB Transaction Error' len 1 slot 7 ep 3 type 'Transfer Event' flags e:c
 1 0x00000000ffffc2e0: TRB 00000000ba600010 status 'USB Transaction Error' len 1 slot 1 ep 3 type 'Transfer Event' flags e:c

Some UAS transfer completes normally. Then the 1-1/2-1 hub is
disconnected from the root port 1/5. USB2 disconnection is reported
first and causes removal of unknown devices on slot 3 and 5.

USB3 disconnection is reported later and causes 2-1.3 endpoint 0x83
to be stopped (probably URB unlink?) and the device deconfigured.
Stop completes normally at bb030000 (possibly no transfer has ever
completed on this endpoint) and Configure Endpoint gets stuck.

The last sign of life from the xHC are Trannsaction Errors for USB2
status endpoints of those hubs. They get halted and never reset, so
technically it's a spec violation to disable these endpoints, but we
aren't even thinking about doing it yet.

Can you identify the 2-1.3 device? Can it be separated or is all 
this stuff inside one physical box?

Does it help to blacklist "uas" driver before connecting the whole
tree? My guess at this point: probably not, it's not a streams bug.

What happens if deconfigure manually before disconnection:

  echo 0 > /sys/bus/usb/devices/4-6/bConfigurationValue

Will it hang on deconfiguration, disconnection, or not at all?

Regards,
Michal
