Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A553D5657
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882678; cv=none; b=Zh1Dr3HXuCGHNF/vppKjU/XE25Wv9GRDwTfFYVLptl3Tdaw/luWIKvtnnigLhaRnuhtgLJLtZlGZnT6OzYqyFDlV7dF3TydhsSAn7mOH3RRNjN0baabHY5SqP/1q9uevQ0invqV4NK2FYxt+9mCAKt//GfSrCo0d6pKgrHPLeCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882678; c=relaxed/simple;
	bh=bA0ojffaBxKxeWvxGumymJvixc9RGgZCEr8WR+dCnTs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KegMVkRd2frycEIhQCXUzSGFKDE8DqLn1QRtwNS09FYguG2b4iOm+LwGxmFLNQR/cLZFees8eU3e7rU+T6gAsjojaTMOvgs3NveyuRvATibKiPcxEiYyn8S7pteu+eaQE0v3MFQHIDvjgWLcwvNyfdS540cvUR1Ttf/6p2tM9g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvngO2D6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvngO2D6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so3196755e9.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882675; x=1792487475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HorRZsv0ApFSmwyBfGvfcGzqRjtFYOH4ZKXfvPQUyFI=;
        b=TvngO2D6HRuMy/2pf9pLZgq64Cy+ZYJAqtQ5IA6VKitTuNdzAQR6v0DrzyOr4Ge2Kv
         4dbsOUhIF3Yn+6b+F01wl6W7oP6MQk6aormWcpr6GEO1J9JxbRBrqY5AvRhO94KacYnd
         9Wf1dVca7Eru8A8MXEgSoRc5WE5JJ3hS2lKJEFG39UrtH9mKHZKMJAV7yDYdW/8UVL4+
         0p6zmYnOPoqNMZEQ/gtWRG89SLQgcMBXfV0lUg7STElLbnzjYPluZP80k83vMPyYVpKi
         kfHdDdr2zaZrw8u6AYhQ+UAstC6lpp9DC9ql77NTEacMmF1IBpLUmA1fnDs6DV0XLJ12
         GooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882675; x=1792487475;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HorRZsv0ApFSmwyBfGvfcGzqRjtFYOH4ZKXfvPQUyFI=;
        b=TGNYaCA6ZoQen5J9xRN+EMfqwHsBkXRq5FeMK78nFNrpnpw2SEsixUAqP98WHr+La9
         2uK+Z0En8izjXbuwj/BtFGuG7Zif54Rc3oXlJFy4ToebDPPMVbC97VAYlCT4bCrmyNrU
         myDbacEOhrL336RHisrvLEY406RIh8GxVf9y02rUvxrzCG+L/9zeWSqHbRVz4u8akeWT
         QImq3XCqy4P0huEK7WsKaarN/o9t6xRisyQa8YJxTKPaGMtRsmoX2HKdgKVueKEGtiZc
         a3O5a5zVsL8GVXSGNHed4TL1HP0LvrdmWuCP1+1FMAoBrpOWU83AF0wIVuxYOQQqNjWH
         BB7g==
X-Forwarded-Encrypted: i=1; AKwUvBxhCDeeyMIizHO8Wou2q1dDeE8wFCTS5h1stZIRcLkD5F1aQWSlVxfLbri745UbWXQeXT+hEyj/Bbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMeDokXI4+vfuGu3Sb7pDbP8HZT1Izo+vZVOnyL/mdOa6dt54Q
	jMlQkKI354RiCF3BnshqjylIoHP5eS9ZeJ/i+3UjXeq3OpIKDNc/yxmu
X-Gm-Gg: AYBFou34FuoZ/gErikiOioNWeFCer8farPp74A1OnPqVunQ/KMYd7UMRIAGMdqrEe4i
	54ut76yB/Wybe+LxVSgTQVHZvepTxbb37kFFRXpSOk13IptaHKmeSgCnYNjNQpHM7QHkeRjiAEZ
	V7LFhcekv5m+d8Tf0VVSk/f1sqrRtiucHXFDnNeOCCe2BiSWTYc8Jxi9e6Qlbvz/W1ALU42fGBq
	oFi2OQYQaK5iJs3vyfXul2pcWClK7WVMmlogl8cVZR9prV/8QEHG7DqJv8IkW8SAVSgL3/TOnMY
	NuDl9XXppGJH9KVpy3rgc8C+pfac/eI1qGfj9mwtwmIvTIedERoFHvov89OOtEmHzj6z5fsScuS
	M5EdEufIVAKc76LZ4D1Tph5Jw8Vb2AZlr1bQxbzlfEDVakfXSvP4Ig6RtL//CvWCi/8Ci/RtKVE
	OmeIx9b/pO3abyvsV8f4EcxzgO/x6MBBtB8A7xUNdDERLZYhRliETCEqXgab4qcrAq7D7yLg0OU
	IF5gSFSAw==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr240551845e9.20.1791882674629;
        Tue, 13 Oct 2026 02:11:14 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm399607545e9.7.2026.10.13.02.11.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 13 Oct 2026 02:11:14 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:11:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
Message-ID: <20261013111110.423dd0ff.michal.pecio@gmail.com>
In-Reply-To: <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
	<20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
	<68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
	<82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
> > xhci is the one allocating the ring when adding an endpoint, and
> > telling xHC hardware to write to that ring. It seems more
> > approriate that xhci should be the one freeing the ring after it
> > told xHC hardware to drop the endpoint, and there no longer is a
> > risk on hardware accessing it. 
> 
> Hi Mathias,
> 
> Sorry for the late response.  Was out last week.
> 
> Specifically in the disconnect path (while audio offload is active),
> when we utilize the usb_set_interface() path, it'll return early due
> to the iface->unregistering check.  This would lead to the
> drop_endpoint not to be called, and rely on the xhci_free_dev() to
> handle the transfer ring cleanup.  This wouldn't work in the offload
> situation, because qc_audio_offload is the only entity managing the
> DMA pool, and that would be freed during the .disconnect callback,
> which happens BEFORE xhci_free_dev().
> 
> Would you be more inclined to prefer a solution where we can defer
> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
> adding another sideband notifier (sb->notify_client) enum to tell the
> client driver that it can release the pool?

I'm not Mathias but my opinion is the same as always: none of these
problems would exist if the sideband client allocated and freed all
transfer/event ring memory, and xhci-sideband only owned a mapping.

The mapping would be freed by xhci_sideband_unregister() or similar
calls, which should ensure that the xHC stops using the rings, and
memory would only be freed by the client driver after unregistering
the sideband and stopping the coprocessor. Nothing is ever UAF or
leaked, and ensuring this is *easy*. And if xhci-hcd randomly wants
to get rid of some endpoint, it simply stops using the mapping and
lets the sideband client clean it up two milliseconds later.

One thing I'm not entirely sure about is how we could create this
mapping. Using bare iommu_map() creates a hard dependency on IOMMU.
Documentation/core-api/dma-attributes.rst mentions possibility of
using generic dma_map_() helpers on multiple devices, so maybe this
can work, but I haven't seen existing examples of such use.

And there seems to be one more potential problem case, which hasn't
been mentioned in this thread AFAIK: if xHC resume failes, xhci-hcd
frees its private data and tell USB core to reset-resume devices.
Looks like another opportunity for UAF.

Regards,
Michal
