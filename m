Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.158.91.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387947;
	b=FjimjdX2jS0rbWlwifdOIjNW2ZWnm9k7geXL4JAe5+XGtdlvQ89PeuSel8jUfzy3h2ug
	 k624HWfcPmI0U6ratTndrcLtG2gqDPUiiYb/B0i5XpnR2o94KxcE6/NGWxpiP1O0MQ6st
	 vS/OAbpjarc2tvCd4TSOqJIweDceHsR1CGnIOi4fQ8jGzfB/BbfjDTPMRzbdQB7WDvQMz
	 Aq39+l1ul0DyvAcyBp8a/Hk5k2EX1SDD58DS3DUT+RdI1lWQAkKYNK5VvGJVSpw231aqQ
	 Imq3yKCyswOSO05N4I91BAC0DABPUsF578Br9XelHRIOwZEy1n9TB6NXddK27ucy5tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387947;
	h=DMARC-Filter:DKIM-Signature:X-Sending-Service:Feedback-ID:
	 X-ImprovMX-Server-Id:X-ImprovMX-Session-Id:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=Aj02c1VGiHHLijSWKjdfQMX13c8Jep8K8tXWMlrv3TM=;
	b=VCmADRbSIwVPdAoIUwu7QBAu3BrAYLPZL+JjzisFFKlZ599M1458nfntKpB62aR2LA14
	 HUNQxB3F0kZpVxsfPYwKy7NXVM59m1ALVs5k6tqPQtwfxlk9euer71IJ+0iFD4XzEOaXB
	 mSWQcsHMck6GILBZiGNr4Km+siF3H3ngnoE7GpVFrrHX1VpbNimF+tp6N71OIQ0MvW10n
	 MPRHeQhF88ZL4qEMUBb6kQfZvcv6D9BETfbK3VWmtEXr5ZRf33uEL7DM9UFoMrtiXH1iK
	 Er9li3hvUluOipsePNFiOKAe7uIjPOciOEHp8Cfnn2tMXUZAbQ4hVFNXaCuCLplDrPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=necauq.ua;
	spf=pass smtp.mailfrom=necauq.ua;
	dkim=pass header.d=necauq.ua header.i=@necauq.ua header.a=rsa-sha256 header.s=dkimprovmx2 header.b=MCFf43Xr;
	arc=none smtp.remote-ip=51.158.91.138
Received: from mail12.mxsw1.infra.improvmx.com (mail12.mxsw1.infra.improvmx.com [51.158.91.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE925606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 19:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE925606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=necauq.ua
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=necauq.ua
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=necauq.ua header.i=@necauq.ua header.a=rsa-sha256 header.s=dkimprovmx2 header.b=MCFf43Xr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=necauq.ua;
 i=@necauq.ua; q=dns/txt; s=dkimprovmx2; t=1793387936; h=date : from :
 to : subject : content-type : feedback-id : message-id;
 bh=Aj02c1VGiHHLijSWKjdfQMX13c8Jep8K8tXWMlrv3TM=;
 b=MCFf43XrdmSjKy0AjA+Glflwml1D2w+RrjZOkPKNkXyEwuefgWefh/A81+xhU+TQqTr+0
 S6UCwVUVJ/unfOp9QskK2H7vSWrrsVLaXhSs/Nixf1J0r/BnDfHosw75afSSePP0NRvuQwB
 qWsf5dY2P6Epw7iVstY5m7HTbUtsWRSpRiTAnQZx6ZfAOP5q/R0jbprjEcAvw/Qbc7F6UZN
 rSmFzjkOKdMJD+dYYxfDeVBkGgskvrn0hhxilKjjiJgfhNPbdO/y2tw0dWThRhRorblefON
 dh5D8TYI8T5mK7S6YOXUwrTGuE3/09WkzbHIRt+TAesSxumVflVCQNyu0jxw==
X-Sending-Service: ImprovMX v3.0.0
Feedback-ID: sendsmtp-38567:cust-necauq.ua::improvmx
X-ImprovMX-Server-Id: 088d2cf
X-ImprovMX-Session-Id:
 d9464c4c-1121-4ca5-91fd-01e5fb8370fc
Received: from [192.168.1.7] (host-176-36-68-142.b024.la.net.ua.
 [176.36.68.142])
    by smtp.improvmx.com with ESMTPSA (version=TLSv1.3
 cipher=TLS_AES_256_GCM_SHA384 bits=256/256)
    for <linux-usb@vger.kernel.org>;
    Fri, 30 Oct 2026 19:18:52 -0000
Message-ID: <8a954797-4eb4-44db-b53f-6e83f4b7b03a@necauq.ua>
Date: Fri, 30 Oct 2026 21:17:01 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
From: Anton Bulakh <him@necauq.ua>
Subject: xhci: Gen2 root port links reported as SuperSpeed when port
 capabilities have different PSI tables
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mathias,

Preface: I am not a kernel developer and this was obviously LLM work, 
but I am capable of reading and basic reasoning *before* sending up a 
report and I believe this is real, especially as I was part of the loop 
in testing it with the devices I had at hand and running sudo commands.

Additionally, I had it search for similar bug reports and this was not 
reported yet seemingly (it searched way more than I ever could've myself).

The LLM wrote:

On an AMD X570 board (Gigabyte X570 I AORUS PRO WIFI, chipset xHCI 
1022:149c), devices on the two Gen2-capable root ports always show up as 
"new SuperSpeed USB device" with speed 5000, but the link is 10 Gbps. 
Seen on 6.18.55; the code is the same in mainline and for-usb-next.

The controller has four USB 3.1 Supported Protocol capabilities with one 
port each, and different PSI tables (debugfs reg-ext-protocol):

   cap  PORTINFO    port  PSI
   01   0x10000107  7     0x00050134 (ID 4, 5 Gb/s)
   02   0x10000108  8     0x00050134
   03   0x20000109  9     0x00050134, 0x000a4135 (ID 5, 10 Gb/s SSP)
   04   0x2000010a  10    0x00050134, 0x000a4135

PORTSC of ports 9 and 10 with Gen2 devices connected:

   0x00001603 Powered Connected Enabled Link:U0 PortSpeed:5

xhci_create_usb3x_bos_desc() builds the root hub SSP capability from one 
port_cap only: the first one with the highest revision. All four are 
3.1, so it uses cap 01, which has only ID 4. get_port_ssp_rate() then 
finds no sublink speed attribute with ID 5, returns USB_SSP_GEN_UNKNOWN, 
and the device gets USB_SPEED_SUPER.

The link does run at Gen2. A SATA SSD and a USB flash drive behind a 
VL822 hub read 849 MB/s together with the hub on port 10, and 425 MB/s 
with the hub on a Gen1-only root port. Devices behind the hub are 
reported correctly as Gen 2x1, because the hub's own BOS lists 10 Gb/s.

A possible fix: build the root hub SSP capability from the PSIs of all 
USB 3.x port capabilities, with duplicate speed IDs merged (the PSIVs 
agree here).

This can also explain the 10 Gbps hub reported as 5 Gbps on an AMD root 
port in https://bugzilla.kernel.org/show_bug.cgi?id=218943.

(LLM out)

Feel free to ask for more info (I wouldn't know what else to provide) 
and I can test kernel patches if needed.

Thanks,
Anton
