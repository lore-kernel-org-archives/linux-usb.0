Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4B490BE7
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471304; cv=none; b=QJn2vyUgRSn486itNZ+wRVEd/18N0pxv5NT9TiN8QonWE1CuW+D8Ten4EvIpI4aHbMRsHC3mwU3gfEjufWkWK3RUeUpCGp2ZjuTrYtMG5VtnjmLF2ajXVGI0XaYteEwy1IxWcNhAt6OCmpFwAsS4XSalf0XkCZdx+r17y0g3Ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471304; c=relaxed/simple;
	bh=PRUCjFdtbE9gjBicCHaEbRoHIWuoHOLjttsgeazNaog=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=P4EKCC7Jx642C5nvw9Bjsz0WEFdq9+OKO6bftj+AMHiQhBTq+RLuImgmS06MmtS7VqncQi0KVPVXuVZXwqNpQWVgzbSh7JGjzWm52p4cnacjcrgEqttpmeJcaU8/bxHTD1iASYRfpUmRMfUig9M+XCgAj2kyE6E7ohPcy8kUcAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=ns.arnold@web.de header.b=DYJjeCCK; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=ns.arnold@web.de header.b="DYJjeCCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1789471300; x=1790076100; i=ns.arnold@web.de;
	bh=PRUCjFdtbE9gjBicCHaEbRoHIWuoHOLjttsgeazNaog=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DYJjeCCKRiqlYB8iHCKpGKApSsbAX1dy7HD/fiT3pdZd2zMtPqSVVdrrorM9Cynm
	 a9Ivz+LR509xkpASwxED6pXNkdX7w8VpvbvNSqQbPTZq8uw9rCPaDjP0OMqZW3jLO
	 BOKIhHsDjEXNgIlz02a8hWN4KboBxroDsAsgQRKgVMKl3qTGiJM9joJR1hbMFq4nN
	 99GUi/pe98NVo8LhUrdHBMONYRCbzqSCBBMwXSSBr5iK6USwJpyZZz5hobkZiMHSb
	 A2G8Y6P/owkZbeDKVJUyXxc4uOby1i7v/fpIfwJiA0pI6xCZ6SmBSppcPmdE3ffqH
	 dgEI5de5B1OnfwdpdQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVad4-1xGNNf3JLQ-00VVZk; Tue, 15
 Sep 2026 13:21:39 +0200
Message-ID: <a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de>
Date: Tue, 15 Sep 2026 13:21:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: linux-usb@vger.kernel.org
Cc: Sanath.S@amd.com, Basavaraj.Natikar@amd.com, superm1@kernel.org,
 westeri@kernel.org
From: Nils Arnold <ns.arnold@web.de>
Subject: AMD Strix Halo USB4: 20/40 Gbit/s negotiation with RJ45 and original
 host-reset patch regression
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:OLvpL0+TJiJYWGyohOrmjnm06j1J6URIPuruQRjiMTOrGjV9AGf
 vHQec7aHnQL/R1pz+d015XtnHNIIArrREbJWlg98F9MG0YwtBFioy41UfNZgUyB2MKL6f5S
 lT/T4Cdv+R3rL1Kr38Ki3gK8KjKp4OrBtPGkepnr6RL2oS8astRwAhcrhVbW0Fkz9rewjtN
 0sQShl0E6lIFymIjZdNNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0KLuN2ThLTQ=;haZosCFgjsA7VEcs2tj3cMTQVmD
 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

Hello Sanath, Mario, Mika and Basavaraj,

I would like to add test evidence from two Strix Halo hosts to this
USB4 reset discussion. My reset test used a backport of the ORIGINAL
f1de1fc5f632 commit, not the newer deferred-reset implementation.
I have not tested the revisions discussed on September 15.

I also observed a separate 20/40 Gbit/s negotiation issue involving RJ45.
I am keeping the observations separate because I have not established
a common cause.

The OdinLink side of this report is also tracked here:
https://github.com/Geramy/OdinLink-Five/issues/31

Separate physical-link negotiation observation
---------------------------------------------
I connected both hosts to the LAN through their RJ45 Ethernet ports
and directly to each other with one USB4 cable using the rear ports.
With both RJ45 connections active, USB4 reported RX/TX 10 Gbit/s x2
(20 Gbit/s per direction) on both hosts. An initial USB4 reconnection
still resulted in that lower rate.

I then disconnected the RJ45 cable on Host B, leaving Host A's RJ45
connection in place. I subsequently unplugged and reconnected USB4.
Both hosts then reported RX/TX 20 Gbit/s x2 (40 Gbit/s per direction).
The kernel journal records Host B's Ethernet link going down, followed
about 3.5 seconds later by USB4 disconnection and about 13 seconds after
that by peer rediscovery. Neither host rebooted during this sequence.

I then reconnected only Host B's RJ45 cable. Its Ethernet link returned
at 1 Gbit/s full duplex, and USB4 REMAINED at 40 Gbit/s on both hosts.
Thus 40 Gbit/s was recovered after removing one RJ45 connection and
reconnecting USB4; it did not require keeping RJ45 disconnected afterward.
This is an observed association during negotiation, not proof that RJ45
causes the lower rate: both Ethernet link state and USB4 reconnection
changed before the successful negotiation, and no repeated controlled
A/B series isolated them.

A separate boot test with both RJ45 connections active also showed
20 Gbit/s USB4 before OdinLink was loaded; loading the identical OdinLink
driver afterward did not change that rate.

The 40 Gbit/s value describes negotiated physical link speed, not a
successful throughput test. After recovery, Thunderbolt networking still
exhibited a TX stall after approximately 255 packets. These observations
are separate from the reset-patch experiment below; a common cause has
not been established.

My observation with an Intel Thunderbolt peer
-----------------------------------------------------------
I also observed successful 40 Gbit/s link negotiation when connecting an
AMD USB4 host to a third computer with an Intel Thunderbolt controller.
This is a useful comparison with the AMD-to-AMD connection
that negotiated only 20 Gbit/s in the cases above.

I have not yet located a specific captured log for this observation.
I have not established the exact Intel controller ID, which AMD host and
port I used, cable identity, RJ45 state, software versions, or repeat count
for this report. I therefore cannot present it as a controlled A/B
comparison or as evidence that all Intel-peer connections are stable.
It suggests investigating peer-dependent link negotiation, but does not
isolate AMD hardware, firmware, Linux software, or the cable as the cause.

Original reset-patch experiment
------------------------------

I tested the original commit
f1de1fc5f632cdeae1f5c2984572ab710d4dfcaa, backported to Fedora
7.2.4-200.fc44.x86_64. I have not tested the v5 hot-unplug patch or the
subsequent deferred-reset/workqueue proposal discussed on September 10.

Setup
-----
Two AMD Ryzen AI Max+ 395 / Strix Halo hosts connected directly over USB4.
AMD USB4 NHI PCI device IDs present: 1022:158d and 1022:158e.
Both hosts ran the same Fedora kernel version, thunderbolt_net, and the
out-of-tree OdinLink driver (odl_tb5), wkljohn/OdinLink-Five commit
bbcd87c2249935769960362dc891b700ec6ace27.
OdinLink was READY and Thunderbolt networking was reachable before teardown.
I stopped model inference for the transport test.

Backport detail
---------------
The Fedora source used nhi_pci_shutdown where the newer upstream context
used nhi_pci_release_irq. The existing shutdown callback was retained and
the reset_interface = nhi_reset_interface callback was added. No other
changes to the patch were made. The module was built against the running
kernel headers and Module.symvers and loaded temporarily, with Secure Boot
disabled. This is a modified-kernel, out-of-tree-driver configuration.

Comparison
----------
With the stock Fedora thunderbolt module, I completed two series of five
OdinLink unload/reload and bidirectional integrity-test cycles (10/10).
The second series also checked Thunderbolt-network ping each cycle.
Each load test used eight streams per host, 400 messages per stream, with
message sizes alternating between 1048576, 350208, 128, and 8192 bytes.
No new CRC, overflow, fragment-sequence, or payload-integrity errors were
reported in those baseline cycles.

With the backported original reset patch, the first coordinated OdinLink
unload failed. The logs confirm that the host-interface reset ran on both
hosts. Both logged ring_interrupt_active warnings. Host A also logged
tb_ring_free warnings. Host B logged a dangling control request and a
tb_ctl_stop warning before its reset, followed by ring warnings, list_del
corruption, and kernel BUG at lib/list_debug.c:62!.

On Host B, rmmod odl_tb5 remained in uninterruptible sleep. Thunderbolt
network connectivity was lost, and the intended load test could not start:
0/5 patched cycles completed. Software reboot requests did not complete
during the subsequent observation period; hard power cycles were required.
I did not install the test module persistently.

Interpretation and limits
-------------------------
This is additional evidence of the original host-wide reset interacting
badly with concurrent networking and an out-of-tree DMA service. It does
not isolate a mainline-only bug or establish the precise cause of the list
corruption. The failure was observed in one patched teardown attempt; the
stock baseline passed ten cycles. The newer workqueue proposal has not
been tested in this setup.

These results do not establish a cause or fix for a separate 20-versus-40
Gbit/s physical link negotiation issue. They also do not validate a fix
for sporadic CRC errors, which did not reproduce in the baseline series.

Would this concurrent tbnet/OdinLink teardown case be useful for reviewing
the deferred-reset implementation, and which specific trace points would
help distinguish an OdinLink teardown issue from a core NHI reset issue?

Please feel free to reply to this email if you need additional information,
sanitized logs, or specific test steps. I can help with targeted testing
on the affected hardware, subject to system availability. Please include
the exact patch/version and test procedure you would like me to use.

Related discussion:
https://lkml.iu.edu/2609.1/08435.html

Current thread context:
https://lists.openwall.net/linux-kernel/2026/09/15/576

