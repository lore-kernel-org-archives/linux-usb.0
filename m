Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F196F3603DB
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 03:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505045; cv=pass; b=f0SPs5zKWgRfrxsLrzu1RWy7/0w/QdcIJuhWNwF5R7E7p7uhpgODjYDyKFTsEGfrgxizftgMz05//Flln/PPhzU5XGpQ8hmpdxl2AQM4OOc+4HEZnOg4+yUuyQh7GtNFf5yrcF0Jg6ns8etQgA0xmrRPlGyeTMy2L3+gzVM7tDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505045; c=relaxed/simple;
	bh=zBt/qZgsLXTMNMb03BartQTDgFJ4whNRfaR5h2RGGdA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sKcXeJ5OoNHBzo3jgjsz94ZFfHK7G/YIWPsL21fEUoFcC5CLmj6hL4FCYR68jGYrYjPXFB6B4KvjdOmvJtUmov8220YXtheA+JHhTbP5bB4z+9oGXmnk92AWx63k+IxTzF1obodFHw4YvPS4FCQrNOOQo3iLWrvWf9jviHCKrj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV/2LRTS; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV/2LRTS"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6688acd1a51so867916d50.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 20:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786505043; cv=none;
        d=google.com; s=arc-20260327;
        b=lE5i24Io+jbl2VK1R0YvKRkjl95KEhvwxuj9FMs8o8disfl8JI6JscokIWYU/ASPWS
         CplyE7eFe0ajmoxMZv869GTBGA0ol7aW6RMTW5PnpFHM//6tyXRIloxstjkFtims31zQ
         0UjEKM7R3JC91e1CjDt9+3Yfkm1Z/BUO71raGjx8RhO0J0qZ2kTy74/e6M2AGNUYa9wB
         EVm1PFM7J1v+s6geEbki0KV9tJUos7uh2LdV7Buc4a4y6XQx3cqxk0Es+bKs8DDrVdUl
         FIJQZ6pPKY/QGxcMDiQTd8TeHoqg1HBQAZqrW6CP6vshM8Ej7s+4lBdyFdhubVGik/yq
         rQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zBt/qZgsLXTMNMb03BartQTDgFJ4whNRfaR5h2RGGdA=;
        fh=n+fUVDIvOsMGbOf7naybW3/ZjJcXmo+HftgZTio9Ilk=;
        b=hdzPHFTC2Qn53IGZCZO4W67DiD5A3RcxChiWmp0Uc8+XpfGB4t4+MGQmxxSPyKG4jK
         kdkwNQRdHMfJPqNEuFofpP4CxekMJtzpKxYXCbkKcANsgw3yWSUhU4tExuJp0+KOTVQ3
         Y0LocrdALXwhxCyVMbhFYG4ZCFOvOkx8UL8XPBAbBWNOoyy69IHm3VvJ5EULEVHigNdL
         UhDyJxM0QesGXS/MgZAruRTnWai6hne2o9l9uf4VuAjCWn2xf0U+hTe3bbKjrHQRbgMk
         AK3MU6mE1mgyiZbvQIIwCmKxQoaISqLqXY+6oG7S5dIxEbvLZrU1idrC/SzGd9fSdWXL
         myMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786505043; x=1787109843; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBt/qZgsLXTMNMb03BartQTDgFJ4whNRfaR5h2RGGdA=;
        b=kV/2LRTSbdbBxDNs1bLCyjdBWGMhnawOG6CDKgQLoN/4pMaImkYOv082HVAe2S3UEh
         9FKudCFR1o2FsN4+EwvFbe92iFXoza8XUfA6ac9E9z7dwQtZFXFidwcjsbOex13cNaVx
         c5UweBT+b/kidyUEIDFWAJfojNWVx/qcsi9ZnEbUg9s2aafpYhgWWd/U17XracF8Pcog
         JQoPqh9HJzXl9zhfQzI3TIGOE7BlGaFGObSVGaLTp++rzlZtFaD9Gku65B2jjdJKfe/+
         9F//IBcPwL7qqN6voRMfo1kEDczp5nVF5+wJWVIru5lpRDaCPcvM7A8yGXm+y92/o1e4
         Ze/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786505043; x=1787109843;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zBt/qZgsLXTMNMb03BartQTDgFJ4whNRfaR5h2RGGdA=;
        b=s/RRkvc1xk6DQo5H4z4E1+sG0QoyYpkwtzE6tAP5w/XX3SiEHk3yWezjeRbAOnGzm+
         ymHVjZctdPuWOSxXYacebPBb/M85wUVGVC7IrKeJbgEw1EpIxkmM+ai92/uUmIbqCNh4
         1kCT2vRou0H6yu3yoIft0x0CCiH3rO5wj1RXU5vzBSKjyDIIaAJAS+r6r3kZs8aEKKNj
         F9Oq9TC1g4m5yGP54AWhMF73p+NJLMQX08gMYxkzeCoeDNYT0w5suc4+ObgLRzYTpM72
         oe1iGd3D9ZfH4QeU+zFT2w2hvHWz4eywO+EwX2OrvzpbU53YOkja7MZjmVPAICWBM+j8
         07yQ==
X-Forwarded-Encrypted: i=1; AHgh+RozGpvSqUI8z/qDkneKtiY3mT+XE2h/wTYP6MOnc/EIKj8zXZ8EgieUjPiqukfiQHeVtIJxQCR4XSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Woz44jOOmpvDLC7WrmxBTpqz0GP054kZ/LvPKkmoIoTHoHBq
	nRvslNItmkxQw6kKjiacFkkPw4WkBZ/PX1auAETEvo5PVtbF/q9KVbgWxL7UwXsmWKVD9rx3YMV
	j9Hi7zpjo6slio1fhT/3dNak1w+hLYqE=
X-Gm-Gg: AR+sD13+yEqoioPSU7yqL6TcAE+YDK2TvvjalJoBL8xa8NFVTZwWhbWG0E5FuRo315h
	D40jdbhFVrpz+QWWw9LPjBPS0gFNQ8J3QQCeNclguTIZcGfilHtCdffW+AFeE/hypb1qBnwdRun
	HSQG5436oUmjMTDQGBTVqf63o9o8iCmLcNOnRQrYzjc2j/dvm7q63VlIPFCUbvV+P/+6HevH0op
	geCMVtZjblc63mz2iaVSFSlp0DCI67Gid3lrOmJKUR1lXimNbuC3aA76LP+i9sOCcqswbLnFgY6
	SG+zjqR0f2zehTX3AtGfY4ObosdddEJRek5qNcf8ohxUlyIlLHIUwZ5U08JdQoHphgsh1DTPqPX
	6KsBSbKovG5KWbHWGMiJQ9DeYUjmxlKa4lBCfyet2gYru5jM6D0frwQfDRCKd83HEpZy6QXbsM0
	p03bwJ3jgttXyy
X-Received: by 2002:a05:690e:1914:b0:66a:c3aa:48ed with SMTP id
 956f58d0204a3-66b340e7a89mr968538d50.11.1786505042781; Tue, 11 Aug 2026
 20:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Tue, 11 Aug 2026 23:23:51 -0400
X-Gm-Features: AUfX_mzugbBOicmHpKoAv3KhC9SvKN-FTdMJ313wWkPqNAHrREXbLVFbdiYcjgU
Message-ID: <CA+Z0x2L0udTqSZ=905W+oV5BSfsp7L+j7FJ5YnkoQPbQbjh7Mg@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] usbip: make remote list honor parsable output
To: skhan@linuxfoundation.org, Shuah Khan <shuah@kernel.org>, 
	Valentina Manea <valentina.manea.m@gmail.com>
Cc: Hongren Zheng <i@zenithal.me>, Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 8/11/26 16:48, Shuah Khan wrote:
> What happens without this patch? Can you elaborate with some examples?

-p is accepted in every list mode and `usbip help list` documents it as
"Parsable list format", but it only ever reached the local (-l) and gadget
(-d) paths. list_exported_devices() never took the flag, so -r ignores it
and always prints the human-readable report.

That is what the reporter hit in bugzilla 219502 -- same flag, same command,
two different formats depending on -l vs -r:

[root@usb1 adminlocal]# /usr/sbin/usbip list -p -l
busid=1-2#usbid=1a86:55d4#
busid=2-1#usbid=0627:0001#
busid=2-3#usbid=11b0:6298#
busid=2-4#usbid=12d1:1506#
[root@usb1 adminlocal]# /usr/sbin/usbip list -p -r localhost
Exportable USB devices
======================
- localhost
2-3: ATECH FLASH TECHNOLOGY : Kingston SNA-DC/U (11b0:6298)
: /sys/devices/pci0000:00/0000:00:1d.7/usb2/2-3
: (Defined at Interface level) (00/00/00)

I reproduced that here: `usbip list -r <host>` and `usbip list -p -r <host>`
produce byte-identical output, so -p is a no-op on the one listing mode a
script is most likely to want it for. Automating attach against a remote host
means scraping the decorated report instead -- the column padding, the
" - <host>" banner, the blank line between devices, the per-interface lines.

After the patch, -r honours -p and emits the record shape local already uses:

$ usbip list -p -r 127.0.0.1
busid=1-1#usbid=0781:5583#
busid=1-2#usbid=046d:c52b#

so the obvious loop works against a remote host:

for b in $(usbip list -p -r "$host" | sed 's/^busid=//; s/#.*//'); do
usbip attach -r "$host" -b "$b"
done

On the same device set, `usbip list -p -l` and `usbip list -p -r <host>` are
now byte-identical -- one format for both sides.

Three things I checked:

- Without -p the remote output is unchanged; before and after diff clean.

- The connection stays in sync. Interface records are still read from the
socket in parsable mode, only the printf is suppressed. To confirm that
rather than assert it, I had the test server withhold the final 4-byte
usbip_usb_interface record for 3 seconds: the patched client with -p blocks
for the full 3 seconds, so it really is draining every record.

- With no exported devices, -p prints nothing on stdout ("no exportable
devices found on <host>" still goes to stderr), so stdout stays clean.

While checking that, I found the option order is a bug in its own right:
usbip_list() acts on -r, -l and -d the moment getopt_long() returns them, so
anything parsed afterwards is ignored. -p only works if it comes first --
"usbip list -r <host> -p" silently gives you the decorated report, and -l
and -d behave the same way. I have fixed that as a second patch in v3: the
mode is recorded during the option loop and run once parsing has finished,
so -p applies wherever it appears. When several mode selectors are given the
first one still wins, as before. Both orders and the long forms now produce
the same records, and the human output is untouched.

Testing disclosure: my checkout is on macOS, so I have not run a native
USB/IP stack end to end. The numbers above come from building the real
usbip_list.c, usbip_network.c, usbip_common.c and names.c against a stub
libudev -- the remote path never calls udev, and the stubs abort if reached
-- and pointing that binary at a small mock usbipd answering OP_REQ_DEVLIST
with a real OP_REP_DEVLIST payload. The -p -l side is a second build with a
fake udev backend presenting the same devices. So it is the real listing path
over a real socket, but not usbip-host/usbip-vudc on hardware. Happy to redo
the runs on a Linux box, or to have someone with a usbip setup confirm,
before this goes in.

I will send v3 as a two-patch series with a condensed before/after folded
into the first commit message, unless you would rather see the ordering fix
kept separate.

thanks,
Jason
