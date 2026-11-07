Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794043145;
	b=rXWO2Q/0yzSa1ZTeF3dh0+iGz/fbLLlmEYcGBDOpsXFx0qe7L5Raq5afVRbFA3mFC2MR
	 KiT/XWkCbGRIf4mcHTX9UHahr03xegwpQv5bFx5xb9ctR3IQLaDNxcympo3b4P5HA3Kpf
	 24UhYNDsABhsYjj9/CJcX6EhxMQ22RShIGzYMIDj0Mzk6kbTSl8Nj1pM610omD16l3uFB
	 kMXOhojh4/FxpGW8GJeJ9q6gtfK+AasjP7GaCBwtJ7iyorfZHdQJ+VoYUXP8vSvVXDHTo
	 7rqv4E9SP2/WCWvV1QKsCOc+1YsrthmmebG76QzLKXMNA2oKprVSC618ZlnadpAQ/dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794043145;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=gWX76DUH/5qxlOuHh0XLFiJD1NTWFF8K6aYDEW2Rot4=;
	b=uwTzAcy3jFMnRlchnHh+R1rS8xsHS2fQvLFhF1mVMMhrasiZECPZrzcqbChZrwQZ/lrx
	 kY1FVURKWFcL6yoU/P63dwrUejlau0GZq9L6yJiornj0O6IIGrPNBI3QP0xcOf1fZ5mfL
	 PxHFIygmfU+L+rwxR83TttOgwhasuco4O0ZrpQ1M3yyouw58+fLUTGmRpEap0xkxon/hJ
	 LlDNgNMNUFAgIzOJ/am3U/Xp/CUbuPwrI4WlXuT7DnjS2H5yoKnAHPmxyHMgIlLcyoxnC
	 SboiyorlfVYXjLoMYX1XKjLGdJG4O8iQDjZFfGYERfeM0YplqSwREWJZwXOeQ6/A+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QocY+0G8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f3v8VmoB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QocY+0G8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f3v8VmoB;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F4606A326;
	Sat,  7 Nov 2026 09:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QocY+0G8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f3v8VmoB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QocY+0G8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f3v8VmoB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B46F1F7A0;
	Sat,  7 Nov 2026 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794043142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX76DUH/5qxlOuHh0XLFiJD1NTWFF8K6aYDEW2Rot4=;
	b=QocY+0G8eZT03McE6YaLKIb3fKN5xO4Qf/Y/BjmIJoozSUNcExhu4pw27+aftiBIdUq2Ri
	jjqD1uE5huada/zRic8oFwV4n3EyvJEFYoZWJHqFfox9JP3j4Q1vh9Au5sHS26sPyj4PLd
	3uyMm8/JURL8lJp9hSzaZl5MN1hSOCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794043142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX76DUH/5qxlOuHh0XLFiJD1NTWFF8K6aYDEW2Rot4=;
	b=f3v8VmoBrXxferi/PdvfoJp3VyY5DzAHVADQ1ThUV3rd9c5Es0aHYglrTT2MWRDW2+5pV2
	Y5KG68nUnhEqHoCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794043142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX76DUH/5qxlOuHh0XLFiJD1NTWFF8K6aYDEW2Rot4=;
	b=QocY+0G8eZT03McE6YaLKIb3fKN5xO4Qf/Y/BjmIJoozSUNcExhu4pw27+aftiBIdUq2Ri
	jjqD1uE5huada/zRic8oFwV4n3EyvJEFYoZWJHqFfox9JP3j4Q1vh9Au5sHS26sPyj4PLd
	3uyMm8/JURL8lJp9hSzaZl5MN1hSOCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794043142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX76DUH/5qxlOuHh0XLFiJD1NTWFF8K6aYDEW2Rot4=;
	b=f3v8VmoBrXxferi/PdvfoJp3VyY5DzAHVADQ1ThUV3rd9c5Es0aHYglrTT2MWRDW2+5pV2
	Y5KG68nUnhEqHoCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E11EB132C9;
	Sat,  7 Nov 2026 09:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ryfiKwXt7mqHagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 09:19:01 +0000
Date: Sat, 07 Nov 2026 10:19:01 +0100
Message-ID: <878q35yp6i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hoshino Lina <lina@lina.yt>
Cc: Christoph Cheaure <cheaure@gmail.com>,
	linux-sound@vger.kernel.org,
	tiwai@suse.de,
	linux-usb@vger.kernel.org
Subject: Re: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c): corrupted playback on ~20% of stream starts, fixed by quirk_flags 0x100010
In-Reply-To: <fd618d1b-d4b2-44cc-b08d-7e664938e771@lina.yt>
References: <CAJr_eQ4QhhZTqjVRmRWLBMMVhqmx-dS_yC9TiozB8qS-ZCnDTg@mail.gmail.com>
	<fd618d1b-d4b2-44cc-b08d-7e664938e771@lina.yt>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.de];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 07 Nov 2026 04:53:37 +0100,
Hoshino Lina wrote:
> 
> Hi,
> 
> On 2026/11/07 8:26, Christoph Cheaure wrote:
> > Subject: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c):
> > corrupted playback on ~20% of stream starts, fixed by quirk_flags
> > 0x100010
> > 
> > Hi,
> > 
> > I'm seeing intermittently corrupted playback on an RME Digiface USB
> > (2a39:3f8c) with the in-kernel support added in 6.12, and found a
> > quirk flag combination that fixes it for me.
> > 
> > Symptom
> > -------
> > On roughly 1 in 5 stream starts, the playback output is corrupted:
> > any non-zero signal comes out heavily distorted / with clicks, on all
> > outputs, including the analog phones output (channels 33/34). Digital
> > silence stays silent, which made the problem hard to spot. The bad
> > state persists for the whole time the PCM is open; after closing and
> > reopening, the next start is usually clean.
> 
> What you are hearing is what happens when playback falls behind by one
> USB frame on the Digiface. This happens mainly due to a bug in the
> xHCI kernel driver related to isochronous scheduling when IRQ latency
> spikes occur (together with the Digiface handling playback underruns
> rather poorly). I no longer contribute to the kernel directly for
> personal reasons, so I filed it here on Fedora, but it was never
> triaged/forwarded:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2451673
> 
> I mitigated this issue by manually binding IRQ affinity of xHCI
> controllers used for audio to specific CPU cores, and keeping other
> IRQs off of those cores. I wrote a tool for this here (which is
> intended to improve low-latency proaudio stability in general and
> reduce xruns, mitigating this bug is just a side effect):
> 
> https://github.com/hoshinolina/proaudio-setup
> 
> The quirk will not fully fix the underlying issue, which can cause
> this to happen any time a latency spike occurs during
> playback. However, if you find that it happens often when the device
> is opened, and the quirk makes that more reliable for you, it sounds
> like a good idea anyway.
> 
> It might be a good idea to take a usbmon log like I did. That might
> clarify whether what you're seeing is the same latency spike I was
> seeing happening some of the time early on during PCM open, or truly
> an issue with playback/capture open order. If it really is a startup
> order issue causing the offset, then the quirk is correct regardless
> of the latency problem.

Thanks for sharing the information.  I guess we should ping USB devs.
Adding linux-usb to Cc for awareness.

And, yes, if the USB-audio quirk option improves, it's worth to take
it as default.  But, it'd be better to be investigated the root cause
at first, of course.


Takashi

> (Note to anyone submitting a patch: I do not receive patch emails or
> most anything else kernel related these days, nor do I have time to
> test patches personally on the machine with the Digiface, so please
> don't expect me to review/reply to anything that comes from this
> discussion.)
> 
> > 
> > Environment
> > -----------
> > - Kernel: 6.12.95+deb12-amd64 (Debian bookworm-backports), x86_64,
> >    Intel NUC (Tiger Lake)
> > - Device: RME Digiface USB, 2a39:3f8c, bcdDevice 3.01, high speed,
> >    on xHCI 0000:00:14.0 behind the board's internal VIA USB 2.0 hub
> > - 48 kHz, 34 out / 32 in, S32_LE, period 384
> > - Clock: synced to S/PDIF input 1 (external master clock); the
> >    problem also reproduces with internal clock
> > 
> > Reproduction (PipeWire stopped, plain ALSA)
> > -------------------------------------------
> > - 34-channel S32_LE 48 kHz WAV with a 400 Hz tone at -24 dBFS on
> >    channels 1/2 and 33/34 (phones)
> > - repeatedly: aplay -D hw:CARD=USB24262729,DEV=0 tone.wav
> >    (3 s per run, 1 s pause, each run opens the device fresh)
> > - listen on the phones output: each run is either clean or corrupted
> >    for its whole duration
> > 
> > Minimal reproduction (PipeWire/PulseAudio stopped):
> > 
> >      python3 - <<'EOF'
> >      import wave, struct, math
> >      amp = 0.06 * 2147483647
> >      frames = b"".join(struct.pack("<34i", *[int(amp *
> > math.sin(2*math.pi*i/120))
> >               if c in (0, 1, 32, 33) else 0 for c in range(34)]) for
> > i in range(120))
> >      w = wave.open("/tmp/tone34.wav", "wb"); w.setnchannels(34);
> > w.setsampwidth(4)
> >      w.setframerate(48000); w.writeframes(frames * 1200); w.close()
> >  # 400 Hz, 3 s
> >      EOF
> >      for i in $(seq 30); do
> >          aplay -q -D hw:CARD=USB24262729,DEV=0 /tmp/tone34.wav; sleep 1
> >      done
> > 
> > Each aplay run is either clean or distorted for its whole duration.
> > 
> > Results (bad starts / total)
> > ----------------------------
> > - default, external clock:                  2 / 30
> > - default, internal clock:                  7 / 30
> > - lowlatency=0:                             no improvement
> > - keyboard/mouse unplugged (same xHCI):     no improvement
> > - quirk_flags=0x100000 (FORCE_IFACE_RESET): 7 / 110 (~6%)
> > - quirk_flags=0x100010
> >    (FORCE_IFACE_RESET | PLAYBACK_FIRST):     0 / 90
> > 
> > Exact setting used (/etc/modprobe.d/rme-digiface.conf):
> > 
> >      options snd-usb-audio quirk_flags=0x100010
> > 
> > /sys/module/snd_usb_audio/parameters/quirk_flags then reads 1048592
> > (= 0x100010) for the Digiface.
> > 
> > While the output was corrupted, recordings taken on the PipeWire side
> > (sink monitor) were clean, and the problem reproduces with plain aplay,
> > so the corruption seems to happen after the PCM buffer: in the driver,
> > on USB or in the device.
