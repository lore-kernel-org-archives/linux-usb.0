Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420FA56C631;
	Fri, 16 Oct 2026 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175985; cv=none; b=nMwYcjQy1SX9foxVG7nsuBh3avnXWRzIkxQVxwL2cLGdnZo+s/HBA7w9MMKAXq/0mwez+ALMGzCLJTc5Mswk0iGqYBroQLRqxKmAObtyCaEgRETO6CxolxDDrr5+lI+QeXZy1aavB+MlgP9mI2cNn3qrXMUeFO8Rh/Megg1s6Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175985; c=relaxed/simple;
	bh=D48HLNbR+Re5KKKiLeutDRbm+dA5Az/Vvbho/JPV6ys=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WbkeDTbCqnH1xsD0HHL2ERkVNgzhEge7QEjLk9o0aEmDc+JOtmd4tXsaEk4xkdBYp6Sl67fwZj8hmOGS/609UxmgxMhFwPzbw4HRdVOa/F+HyYyGuHavNROsEftM1er/7Ndr7a2LQu70QK45BaFYPBsI2lmAwDdMmsu2PAEs4L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=KeE6yDcs; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="KeE6yDcs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=NnJQe+jwYYdFezk7bpuRz5AXsgINE1m1O3EmebxNtvU=; b=KeE6yDcskgIV7ZLf
	/smI0WDSPAic1G66uEuPKQVo8JHwYEWNtMCA3LDsxFF2vzS61s7SWfw0Af/WLGQuZRsYi8m01L/sx
	60GxvBLH5yxQCg7+lnzaD5WhFfkJso8IPH6PsUCBm3t4u5k++nynr2bxeMKK2S5xw2PJyt4pVZMEg
	vEywW5HIPDBdL0iU5EapfGLqSefF5yOTBYqhXmzo02Oe80hcz7gU2RCor58wMX0mwIM1n6DZ8xmKQ
	Z+JdP2kKrglNVLafXV5Zb9W1Szoq9WCUesP8uygYxZUC7sRAszL+Ihd7wySpNkjPMyfTAVE67JIZZ
	I1DXIJcLgDSEuDdFqw==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1xHmKw-000000004uQ-2HMv;
	Fri, 16 Oct 2026 18:07:22 +0000
Date: Fri, 16 Oct 2026 18:07:22 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Subject: dwc3 gadget performance (on qualcomm x1)
Message-ID: <atJn2jfI_cZy3UMo@gallifrey>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.113+deb13-amd64 (x86_64)
X-Uptime: 17:52:01 up  3:12,  2 users,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,
  I've got a pair of Qualcomm x1 based laptops wired together via USB
with ncm gadget and am seeing about 3.5Gbps on iperf and wondered
if there was a way to squeeze a bit more out.

  My reading of it (see below) is that it's spending a lot of its
time on the gadget side interrupt, possibly in the lock on the dwc,
but I've not tried debugging around this before, so suggestions welcome.
Would it be possible to handle multiple requests per interrupt?

  From a quick look, it looks like the Qualcomm code should allocate enough bandwidth
internally when it sees a superspeed connection?

Register debug/etc below

Thanks in advance,

Dave

Kernel
  7.3.0-rc6-ish with patches for this laptop.

Hardware
  Asus zenbook A14 ( ASUS Zenbook A14 UX3407QA_UX3407QA/UX3407QA, BIOS UX3407QA.308 03/12/2025 )
Architecture:                aarch64
  CPU op-mode(s):            64-bit
  Byte Order:                Little Endian
CPU(s):                      8
  On-line CPU(s) list:       0-7
Vendor ID:                   Qualcomm
  Model name:                Oryon
    Model:                   1
    Thread(s) per core:      1
    Core(s) per cluster:     8
    Socket(s):               -
    Cluster(s):              1
    Stepping:                0x2
    Frequency boost:         disabled
    CPU(s) scaling MHz:      44%
    CPU max MHz:             2956.8000

Usb negotiated:
  Bus 006 Device 002: ID da5e:da5e trebligorg linux-ncm
  Negotiated speed: SuperSpeed+ (10Gbps)

iperf/guest setup:
  There are two machines:

'dragon' runs iperf -s -V and runs the gadget end.
'soup' runs iperf -c  10.0.0.1 -l 2M -b 10G and is the normal host end.
(Dragon also has a pretty idle desktop on)

vmstat 1:
dragon:                      
procs -----------memory---------- ---swap-- -----io---- -system-- -------cpu-------
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st gu
 2  0      0 10165008 178064 3143440 0    0     0     0 25340 23812 0 12 87 1  0  0
 1  0      0 10164944 178064 3143440 0    0     0     0 30827 29905 0 13 86 1  0  0
 0  0      0 10164944 178064 3143440 0    0     0     0 27157 25001 0 13 86 1  0  0
 1  0      0 10164720 178064 3143440 0    0     0     0 31158 30783 0 12 87 1  0  0

soup:
procs -----------memory---------- ---swap-- -----io---- -system-- -------cpu-------
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st gu
 2  0      0 14637084  58360 653468    0    0     0     0 15958  618  0 16 84  0  0  0
 1  0      0 14636092  58360 653468    0    0     0     0 16740  672  0 17 83  0  0  0
 1  0      0 14636156  58360 653468    0    0     0     0 16793  661  0 17 83  0  0  0                                1  0      0 14638076  58360 653468    0    0     0     0 16266  636  0 16 84  0  0  0


perf (on dragon) <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <>

#
    73.82%     0.00%  irq/184-dwc3     [kernel.kallsyms]                   [.] ret_from_fork
            |
            ---ret_from_fork
               kthread
               |          
                --73.80%--irq_thread
                          |          
                           --73.68%--irq_thread_fn
                                     |          
                                     |--46.44%--_raw_spin_unlock_irqrestore
                                     |          __raw_spin_unlock_irqrestore (inlined)
                                     |          __preempt_count_dec_and_test (inlined)
                                     |          get_current (inlined)
                                     |          
                                      --27.22%--dwc3_thread_interrupt
                                                |          
                                                 --27.22%--__local_bh_enable_ip
                                                           do_softirq (inlined)
                                                           do_softirq.part.0
                                                           |          
                                                            --27.18%--do_softirq_own_stack
                                                                      call_on_irq_stack
                                                                      ____do_softirq
                                                                      __do_softirq
                                                                      |          
                                                                       --27.16%--handle_softirqs
                                                                                 |          
                                                                                  --27.11%--trace_softirq_exit (inlined)
                                                                                            arch_static_branch (inlined)
                                                                                            |          
                                                                                            |--17.22%--net_rx_action
                                                                                            |          |          
                                                                                            |          |--16.34%--napi_poll (inlined)
                                                                                            |          |          |          
                                                                                            |          |           --16.34%--__napi_poll
                                                                                            |          |                     |          


perf (on soup): <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <>
    92.51%     0.00%  ksoftirqd/0      [kernel.kallsyms]                [.] ret_from_fork
            |
            ---ret_from_fork
               kthread
               |          
                --92.50%--smpboot_thread_fn
                          |          
                           --92.32%--run_ksoftirqd
                                     |          
                                      --92.21%--handle_softirqs
                                                |          
                                                |--39.33%--net_rx_action
                                                |          __napi_poll
                                                |          |          
                                                |           --39.31%--process_backlog
                                                |                     |          
                                                |                      --39.30%--__netif_receive_skb
                                                |                                |          
                                                |                                 --39.18%--__netif_receive_skb_one_core
                                                |                                           |          
                                                |                                            --39.08%--ip_rcv
                                                |                                                      |          
                                                |                                                       --39.03%--ip_rcv_finish
                                                |                                                                 |          
                                                |                                                                  --38.93%--ip_local_deliver
                                                |                                                                            |          
                                                |                                                                             --38.90%--ip_local_deliver_finish
                                                |                                                                                       |          
                                                |                                                                                        --38.82%--ip_protocol_deliver_rcu
                                                |                                                                                                  |          
                                                |                                                                                                   --38.77%--tcp_v4_rcv
                                                |                                                                                                             |          
                                                |                                                                                                              --38.68%--tcp_v4_do_rcv
                                                |                                                                                                                        |          
                                                |                                                                                                                         --38.63%--tcp_rcv_established
                                                |                                                                                                                                   |          
                                                |                                                                                                                                   |--37.02%--__tcp_push_pending_frames
                                                |                                                                                                                                   |          |          
                                                |                                                                                                                                   |           --36.91%--tcp_write_xmit
                                                |                                                                                                                                   |                     |          
                                                |                                                                                                                                   |                      --36.51%--__tcp_transmit_skb
                                                |                                                                                                                                   |                                |          
                                                |                                                                                                                                   |                                 --36.34%--ip_queue_xmit
                                                |                                                                                                                                   |                                           |          
                                                |                                                                                                                                   |                                            --36.24%--__ip_queue_xmit
                                                |                                                                                                                                   |                                                      |          
                                                |                                                                                                                                   |                                                       --36.16%--ip_output
                                                |                                                                                                                                   |                                                                 |          
                                                |                                                                                                                                   |                                                                  --36.16%--ip_finish_output
                                                |                                                                                                                                   |                                                                            |          
                                                |                                                                                                                                   |                                                                             --36.13%--__ip_finish_output
                                                |                                                                                                                                   |                                                                                       |          
                                                |                                                                                                                                   |                                                                                        --36.10%--ip_finish_output2
                                                |                                                                                                                                   |                                                                                                  |          
                                                |                                                                                                                                   |                                                                                                  |--18.60%--__dev_queue_xmit
                                                |                                                                                                                                   |                                                                                                  |          |          
                                                |                                                                                                                                   |                                                                                                  |           --18.53%--__qdisc_run
                                                |                                                                                                                                   |                                                                                                  |                     |          
                                                |                                                                                                                                   |                                                                                                  |                      --18.30%--sch_direct_xmit
                                                |                                                                                                                                   |                                                                                                  |                                |          
                                                |                                                                                                                                   |                                                                                                  |                                |--10.09%--dev_hard_start_xmit
                                                |                                                                                                                                   |                                                                                                  |                                |          |          
                                                |                                                                                                                                   |                                                                                                  |                                |          |--5.98%--_raw_spin_unlock_irqrestore
                                                |                                                                                                                                   |                                                                                                  |                                |          |          
                                                |                                                                                                                                   |                                                                                                  |                                |           --3.97%--usbnet_start_xmit
                                                |                                                                                                                                   |                                                                                                  |                                |                     |          
                                                |                                                                                                                                   |                                                                                                  |                                |                      --3.81%--cdc_ncm_tx_fixup
                                                |                                                                                                                                   |                                                                                                  |                                |                                |          
                                                |                                                                                                                                   |                                                                                                  |                                |                                |--2.68%--cdc_ncm_fill_tx_frame
                                                |                                                                                                                                   |                                                                                                  |                                |                                |          |          
                                                |                                                                                                                                   |                                                                                                  |                                |                                |           --1.93%--dev_kfree_skb_any_reason
               |                                |                                                                                                                                   |                                                                                                  |                                |                                |                     |          
                                                |                                                                                                                                   |                                                                                                  |                                |                                |                      --1.85%--sk_skb_reason_drop
                          |                     |                                                                                                                                   |                                                                                                  |                                |                                |                                |          
                                                |                                                                                                                                   |                                                                                                  |                                |                                |                                 --0.68%--skb_release_data
                                                |                                                                                                                                   |                                                                                                  |                                |                                |          
                                                |                                                                                                                                   |                                                                                                  |                                |                                 --0.81%--__pi_memcpy_generic

<> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> <> 
root@dragon:/sys/kernel/debug/usb/a800000.usb# cat lsp_dump 
GDBGLSP[0] = 0x40000001
GDBGLSP[1] = 0x00003980
GDBGLSP[2] = 0x38100000
GDBGLSP[3] = 0x00801000
GDBGLSP[4] = 0x11af1000
GDBGLSP[5] = 0x3e8000fc
GDBGLSP[6] = 0x00003e80
GDBGLSP[7] = 0xfc03f0ca
GDBGLSP[8] = 0x08003fff
GDBGLSP[9] = 0x00000000
GDBGLSP[10] = 0x000000f8
GDBGLSP[11] = 0x000000f8
GDBGLSP[12] = 0x000000f8
GDBGLSP[13] = 0x000000f8
GDBGLSP[14] = 0x000000f8
GDBGLSP[15] = 0x000000f8

root@dragon:/sys/kernel/debug/usb/a800000.usb# cat regdump 
GSBUSCFG0 = 0x2222000e
GSBUSCFG1 = 0x00007f00
GTXTHRCFG = 0x00000000
GRXTHRCFG = 0x00b00000
GCTL = 0x00102000
GEVTEN = 0x00000000
GSTS = 0x7e800000
GUCTL1 = 0x81001808
GSNPSID = 0x33313130
GGPIO = 0x00000000
GUID = 0x00070300
GUCTL = 0x0d014802
GBUSERRADDR0 = 0x00000000
GBUSERRADDR1 = 0x00000000
GPRTBIMAP0 = 0x00000000
GPRTBIMAP1 = 0x00000000
GHWPARAMS0 = 0x4020400a
GHWPARAMS1 = 0x01092486
GHWPARAMS2 = 0x17013c42
GHWPARAMS3 = 0x10420086
GHWPARAMS4 = 0x48622010
GHWPARAMS5 = 0x68410410
GHWPARAMS6 = 0x1834003f
GHWPARAMS7 = 0x0da00d86
GDBGFIFOSPACE = 0x00430000
GDBGLTSSM = 0x9cc20026
GDBGBMU = 0x20340000
GPRTBIMAP_HS0 = 0x00000000
GPRTBIMAP_HS1 = 0x00000000
GPRTBIMAP_FS0 = 0x00000000
GPRTBIMAP_FS1 = 0x00000000
GUCTL2 = 0x00000000
VER_NUMBER = 0x3139312a
VER_TYPE = 0x736f3033
GUSB2PHYCFG(0) = 0x00102400
GUSB2PHYCFG(1) = 0x00000000
GUSB2PHYCFG(2) = 0x00000000
GUSB2PHYCFG(3) = 0x00000000
GUSB2PHYCFG(4) = 0x00000000
GUSB2PHYCFG(5) = 0x00000000
GUSB2PHYCFG(6) = 0x00000000
GUSB2PHYCFG(7) = 0x00000000
GUSB2PHYCFG(8) = 0x00000000
GUSB2PHYCFG(9) = 0x00000000
GUSB2PHYCFG(10) = 0x00000000
GUSB2PHYCFG(11) = 0x00000000
GUSB2PHYCFG(12) = 0x00000000
GUSB2PHYCFG(13) = 0x00000000
GUSB2PHYCFG(14) = 0x00000000
GUSB2PHYCFG(15) = 0x00000000
GUSB2I2CCTL(0) = 0x00000000
GUSB2I2CCTL(1) = 0x00000000
GUSB2I2CCTL(2) = 0x00000000
GUSB2I2CCTL(3) = 0x00000000
GUSB2I2CCTL(4) = 0x00000000
GUSB2I2CCTL(5) = 0x00000000
GUSB2I2CCTL(6) = 0x00000000
GUSB2I2CCTL(7) = 0x00000000
GUSB2I2CCTL(8) = 0x00000000
GUSB2I2CCTL(9) = 0x00000000
GUSB2I2CCTL(10) = 0x00000000
GUSB2I2CCTL(11) = 0x00000000
GUSB2I2CCTL(12) = 0x00000000
GUSB2I2CCTL(13) = 0x00000000
GUSB2I2CCTL(14) = 0x00000000
GUSB2I2CCTL(15) = 0x00000000
GUSB2PHYACC(0) = 0x00000000
GUSB2PHYACC(1) = 0x00000000
GUSB2PHYACC(2) = 0x00000000
GUSB2PHYACC(3) = 0x00000000
GUSB2PHYACC(4) = 0x00000000
GUSB2PHYACC(5) = 0x00000000
GUSB2PHYACC(6) = 0x00000000
GUSB2PHYACC(7) = 0x00000000
GUSB2PHYACC(8) = 0x00000000
GUSB2PHYACC(9) = 0x00000000
GUSB2PHYACC(10) = 0x00000000
GUSB2PHYACC(11) = 0x00000000
GUSB2PHYACC(12) = 0x00000000
GUSB2PHYACC(13) = 0x00000000
GUSB2PHYACC(14) = 0x00000000
GUSB2PHYACC(15) = 0x00000000
GUSB3PIPECTL(0) = 0x030e1002
GUSB3PIPECTL(1) = 0x00000000
GUSB3PIPECTL(2) = 0x00000000
GUSB3PIPECTL(3) = 0x00000000
GUSB3PIPECTL(4) = 0x00000000
GUSB3PIPECTL(5) = 0x00000000
GUSB3PIPECTL(6) = 0x00000000
GUSB3PIPECTL(7) = 0x00000000
GUSB3PIPECTL(8) = 0x00000000
GUSB3PIPECTL(9) = 0x00000000
GUSB3PIPECTL(10) = 0x00000000
GUSB3PIPECTL(11) = 0x00000000
GUSB3PIPECTL(12) = 0x00000000
GUSB3PIPECTL(13) = 0x00000000
GUSB3PIPECTL(14) = 0x00000000
GUSB3PIPECTL(15) = 0x00000000
GTXFIFOSIZ(0) = 0x00000043
GTXFIFOSIZ(1) = 0x0043030d
GTXFIFOSIZ(2) = 0x03508083
GTXFIFOSIZ(3) = 0x03d3030d
GTXFIFOSIZ(4) = 0x06e00083
GTXFIFOSIZ(5) = 0x07630105
GTXFIFOSIZ(6) = 0x08680083
GTXFIFOSIZ(7) = 0x08eb0083
GTXFIFOSIZ(8) = 0x096e0083
GTXFIFOSIZ(9) = 0x09f10083
GTXFIFOSIZ(10) = 0x0a740083
GTXFIFOSIZ(11) = 0x0af70083
GTXFIFOSIZ(12) = 0x0b7a0083
GTXFIFOSIZ(13) = 0x0bfd0083
GTXFIFOSIZ(14) = 0x0c800083
GTXFIFOSIZ(15) = 0x0d030083
GTXFIFOSIZ(16) = 0x00000000
GTXFIFOSIZ(17) = 0x00000000
GTXFIFOSIZ(18) = 0x00000000
GTXFIFOSIZ(19) = 0x00000000
GTXFIFOSIZ(20) = 0x00000000
GTXFIFOSIZ(21) = 0x00000000
GTXFIFOSIZ(22) = 0x00000000
GTXFIFOSIZ(23) = 0x00000000
GTXFIFOSIZ(24) = 0x00000000
GTXFIFOSIZ(25) = 0x00000000
GTXFIFOSIZ(26) = 0x00000000
GTXFIFOSIZ(27) = 0x00000000
GTXFIFOSIZ(28) = 0x00000000
GTXFIFOSIZ(29) = 0x00000000
GTXFIFOSIZ(30) = 0x00000000
GTXFIFOSIZ(31) = 0x00000000
GRXFIFOSIZ(0) = 0x00000313
GRXFIFOSIZ(1) = 0x03138313
GRXFIFOSIZ(2) = 0x06260000
GRXFIFOSIZ(3) = 0x06268000
GRXFIFOSIZ(4) = 0x06260000
GRXFIFOSIZ(5) = 0x06268000
GRXFIFOSIZ(6) = 0x00000000
GRXFIFOSIZ(7) = 0x00000000
GRXFIFOSIZ(8) = 0x00000000
GRXFIFOSIZ(9) = 0x00000000
GRXFIFOSIZ(10) = 0x00000000
GRXFIFOSIZ(11) = 0x00000000
GRXFIFOSIZ(12) = 0x00000000
GRXFIFOSIZ(13) = 0x00000000
GRXFIFOSIZ(14) = 0x00000000
GRXFIFOSIZ(15) = 0x00000000
GRXFIFOSIZ(16) = 0x00000000
GRXFIFOSIZ(17) = 0x00000000
GRXFIFOSIZ(18) = 0x00000000
GRXFIFOSIZ(19) = 0x00000000
GRXFIFOSIZ(20) = 0x00000000
GRXFIFOSIZ(21) = 0x00000000
GRXFIFOSIZ(22) = 0x00000000
GRXFIFOSIZ(23) = 0x00000000
GRXFIFOSIZ(24) = 0x00000000
GRXFIFOSIZ(25) = 0x00000000
GRXFIFOSIZ(26) = 0x00000000
GRXFIFOSIZ(27) = 0x00000000
GRXFIFOSIZ(28) = 0x00000000
GRXFIFOSIZ(29) = 0x00000000
GRXFIFOSIZ(30) = 0x00000000
GRXFIFOSIZ(31) = 0x00000000
GEVNTADRLO(0) = 0xfffff000
GEVNTADRHI(0) = 0x000000ff
GEVNTSIZ(0) = 0x00001000
GEVNTCOUNT(0) = 0x00000000
GHWPARAMS8 = 0x00001834
GUCTL3 = 0x0000560c
GFLADJ = 0x8c80c8a0
DCFG = 0x00a0080d
DCTL = 0x80f00000
DEVTEN = 0x00000e57
DSTS = 0x0083c6bd
DGCMDPAR = 0x00000000
DGCMD = 0x00000000
DALEPENA = 0x0000002f
DEPCMDPAR2(0) = 0x00000000
DEPCMDPAR1(0) = 0xfffe2000
DEPCMDPAR0(0) = 0x000000ff
DEPCMD(0) = 0x00000006
DEPCMDPAR2(1) = 0x00000000
DEPCMDPAR1(1) = 0xfffe2000
DEPCMDPAR0(1) = 0x000000ff
DEPCMD(1) = 0x00010006
DEPCMDPAR2(2) = 0x00000000
DEPCMDPAR1(2) = 0xfffe3000
DEPCMDPAR0(2) = 0x000000ff
DEPCMD(2) = 0x00040007
DEPCMDPAR2(3) = 0x00000000
DEPCMDPAR1(3) = 0xffff9000
DEPCMDPAR0(3) = 0x000000ff
DEPCMD(3) = 0x00030007
DEPCMDPAR2(4) = 0x00000000
DEPCMDPAR1(4) = 0x00000000
DEPCMDPAR0(4) = 0x00000000
DEPCMD(4) = 0x00000000
DEPCMDPAR2(5) = 0x00000000
DEPCMDPAR1(5) = 0xfffdf000
DEPCMDPAR0(5) = 0x000000ff
DEPCMD(5) = 0x00020007
DEPCMDPAR2(6) = 0x00000000
DEPCMDPAR1(6) = 0x00000000
DEPCMDPAR0(6) = 0x00000000
DEPCMD(6) = 0x00000000
DEPCMDPAR2(7) = 0x00000000
DEPCMDPAR1(7) = 0x00000000
DEPCMDPAR0(7) = 0x00000000
DEPCMD(7) = 0x00000000
DEPCMDPAR2(8) = 0x00000000
DEPCMDPAR1(8) = 0x00000000
DEPCMDPAR0(8) = 0x00000000
DEPCMD(8) = 0x00000000
DEPCMDPAR2(9) = 0x00000000
DEPCMDPAR1(9) = 0x00000000
DEPCMDPAR0(9) = 0x00000000
DEPCMD(9) = 0x00000000
DEPCMDPAR2(10) = 0x00000000
DEPCMDPAR1(10) = 0x00000000
DEPCMDPAR0(10) = 0x00000000
DEPCMD(10) = 0x00000000
DEPCMDPAR2(11) = 0x00000000
DEPCMDPAR1(11) = 0x00000000
DEPCMDPAR0(11) = 0x00000000
DEPCMD(11) = 0x00000000
DEPCMDPAR2(12) = 0x00000000
DEPCMDPAR1(12) = 0x00000000
DEPCMDPAR0(12) = 0x00000000
DEPCMD(12) = 0x00000000
DEPCMDPAR2(13) = 0x00000000
DEPCMDPAR1(13) = 0x00000000
DEPCMDPAR0(13) = 0x00000000
DEPCMD(13) = 0x00000000
DEPCMDPAR2(14) = 0x00000000
DEPCMDPAR1(14) = 0x00000000
DEPCMDPAR0(14) = 0x00000000
DEPCMD(14) = 0x00000000
DEPCMDPAR2(15) = 0x00000000
DEPCMDPAR1(15) = 0x00000000
DEPCMDPAR0(15) = 0x00000000
DEPCMD(15) = 0x00000000
DEPCMDPAR2(16) = 0x00000000
DEPCMDPAR1(16) = 0x00000000
DEPCMDPAR0(16) = 0x00000000
DEPCMD(16) = 0x00000000
DEPCMDPAR2(17) = 0x00000000
DEPCMDPAR1(17) = 0x00000000
DEPCMDPAR0(17) = 0x00000000
DEPCMD(17) = 0x00000000
DEPCMDPAR2(18) = 0x00000000
DEPCMDPAR1(18) = 0x00000000
DEPCMDPAR0(18) = 0x00000000
DEPCMD(18) = 0x00000000
DEPCMDPAR2(19) = 0x00000000
DEPCMDPAR1(19) = 0x00000000
DEPCMDPAR0(19) = 0x00000000
DEPCMD(19) = 0x00000000
DEPCMDPAR2(20) = 0x00000000
DEPCMDPAR1(20) = 0x00000000
DEPCMDPAR0(20) = 0x00000000
DEPCMD(20) = 0x00000000
DEPCMDPAR2(21) = 0x00000000
DEPCMDPAR1(21) = 0x00000000
DEPCMDPAR0(21) = 0x00000000
DEPCMD(21) = 0x00000000
DEPCMDPAR2(22) = 0x00000000
DEPCMDPAR1(22) = 0x00000000
DEPCMDPAR0(22) = 0x00000000
DEPCMD(22) = 0x00000000
DEPCMDPAR2(23) = 0x00000000
DEPCMDPAR1(23) = 0x00000000
DEPCMDPAR0(23) = 0x00000000
DEPCMD(23) = 0x00000000
DEPCMDPAR2(24) = 0x00000000
DEPCMDPAR1(24) = 0x00000000
DEPCMDPAR0(24) = 0x00000000
DEPCMD(24) = 0x00000000
DEPCMDPAR2(25) = 0x00000000
DEPCMDPAR1(25) = 0x00000000
DEPCMDPAR0(25) = 0x00000000
DEPCMD(25) = 0x00000000
DEPCMDPAR2(26) = 0x00000000
DEPCMDPAR1(26) = 0x00000000
DEPCMDPAR0(26) = 0x00000000
DEPCMD(26) = 0x00000000
DEPCMDPAR2(27) = 0x00000000
DEPCMDPAR1(27) = 0x00000000
DEPCMDPAR0(27) = 0x00000000
DEPCMD(27) = 0x00000000
DEPCMDPAR2(28) = 0x00000000
DEPCMDPAR1(28) = 0x00000000
DEPCMDPAR0(28) = 0x00000000
DEPCMD(28) = 0x00000000
DEPCMDPAR2(29) = 0x00000000
DEPCMDPAR1(29) = 0x00000000
DEPCMDPAR0(29) = 0x00000000
DEPCMD(29) = 0x00000000
DEPCMDPAR2(30) = 0x00000000
DEPCMDPAR1(30) = 0x00000000
DEPCMDPAR0(30) = 0x00000000
DEPCMD(30) = 0x00000000
DEPCMDPAR2(31) = 0x00000000
DEPCMDPAR1(31) = 0x00000000
DEPCMDPAR0(31) = 0x00000000
DEPCMD(31) = 0x00000000
OCFG = 0x00000000
OCTL = 0x00000000
OEVT = 0x00000000
OEVTEN = 0x00000000
OSTS = 0x00000000



-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
